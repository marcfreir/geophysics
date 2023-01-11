#####################################################
## Shell Script for installing SISMIC UN*X on WSL2 ##
##    Created by Marc Freir - November 2, 2022     ##
#####################################################

#! /usr/bin/env bash
# Set menu color to green
RED="\e[31m"
MAGENTA="\e[35m"
LIGHTYELLOW="\e[93m"
ENDCOLOR="\e[0m"

# Home
# Make bash to be able to send the graphics to Xming
echo "export DISPLAY=:0" >> .bashrc
source .bashrc

sudo apt install -y x11-apps

echo "export CWPROOT=\$HOME" >> .bashrc
echo "export PATH=\$PATH:\$HOME/bin:./" >> .bashrc
source .bashrc



#!/bin/sh

# Check if the user has all necessary programs
if ! [ -x "$(command -v wget)" ]; then
    printf "${RED}ERROR: wget must be installed. You can install it by running this command${ENDCOLOR}\n"
    printf "\n$ sudo apt install -y wget\n\n"
    exit 1
fi

# (WARNING) When setting the variables:
# - Do not use tilde expansion ~
# - Do not end a directory path with a forward slash /
# - If the file or directory has restricted access, run this script as superuser

# Directory where Seismic Unix will be installed
CWPROOT="${HOME}/SeismicUnix"

# Shell config file for setting up persistent enviroment variables
SHELL_CONFIG_FILE="${HOME}/.bashrc"

# Setting CWPROOT
# ---------------
printf "\n"
printf "${LIGHTYELLOW}Seismic Unix will be installed into this location:${ENDCOLOR}\n"
printf "%s\n" "${CWPROOT}"
printf "\n"
printf "${LIGHTYELLOW}  - Press ENTER to confirm the location${ENDCOLOR}\n"
printf "${LIGHTYELLOW}  - Press CTRL-C to abort the installation${ENDCOLOR}\n"
printf "${LIGHTYELLOW}  - Or specify a different location below${ENDCOLOR}\n"
printf "\n"
printf "[%s] >>> " "${CWPROOT}"
read -r selected_dir
if [ "${selected_dir}" != "" ]; then
    case "${selected_dir}" in
        *\ *)
            printf "${RED}ERROR: Cannot install into directories with spaces${ENDCOLOR}\n" >&2
            exit 1
            ;;
        *)
            eval CWPROOT="${selected_dir}"
            ;;
    esac
fi

# Setting SHELL_CONFIG_FILE
# -------------------------
if [ "$SHELL" = '/usr/bin/zsh' ] || [ "$SHELL" = '/bin/zsh' ]; then
    SHELL_CONFIG_FILE="${HOME}/.zshrc"
fi
printf "\n"
printf "${LIGHTYELLOW}This file will be used for setting persistent enviroment variables:${ENDCOLOR}\n"
printf "%s\n" "${SHELL_CONFIG_FILE}"
printf "\n"
printf "${LIGHTYELLOW}  - Press ENTER to confirm the location${ENDCOLOR}\n"
printf "${LIGHTYELLOW}  - Press CTRL-C to abort the installation${ENDCOLOR}\n"
printf "${LIGHTYELLOW}  - Or specify a different location below${ENDCOLOR}\n"
printf "\n"
printf "[%s] >>> " "${SHELL_CONFIG_FILE}"
read -r selected_path
if [ "${selected_path}" != "" ]; then
    case "${selected_path}" in
        *\ *)
            printf "${RED}ERROR: Cannot specify path with spaces${ENDCOLOR}\n" >&2
            exit 1
            ;;
        *)
            eval SHELL_CONFIG_FILE="${selected_path}"
            ;;
    esac
fi

printf "${MAGENTA}\nCreating installation directory${ENDCOLOR}\n"
if ! mkdir -p "${CWPROOT}"; then
    printf "${RED}ERROR: Could not create directory: %s${ENDCOLOR}\n" "${CWPROOT}" >&2
    exit 1
fi

printf "${LIGHTYELLOW}\nInstalling dependencies${ENDCOLOR}\n"

# General
sudo apt install -y gcc make libc6-dev
# X-toolkit applications
sudo apt install -y libx11-dev libxt-dev
# Fortran codes
sudo apt install -y gfortran
# Mesa/OpenGL
sudo apt install -y libglu1-mesa-dev freeglut3-dev libxmu-dev libxmu-headers libxi-dev
# Motif
sudo apt install -y libxt6 libmotif-dev
sudo apt install -y libxt6 libuil4
sudo apt install -y libxt6 x11proto-print-dev

# Update & Upgrade System
sudo apt update -y
sudo apt upgrade -y


printf "${LIGHTYELLOW}\nDownloading Seismic Unix${ENDCOLOR}\n"
# Change for a new version - current version is 44R26
wget 'https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ/download?path=%2F&files=cwp_su_all_44R26.tgz&downloadStartSecret=d0kkx4lkunp' -O cwp_su_all_44R26.tgz

printf "${LIGHTYELLOW}\nExtracting tarball contents to the installation directory${ENDCOLOR}\n"
#tar -xzf cwp_su_all_44R26.tgz -C "$CWPROOT"
# Change for a new version - current version is 44R26
gunzip cwp_su_all_44R26.tgz
tar -xvf cwp_su_all_44R26.tar -C "$CWPROOT"

printf "${LIGHTYELLOW}\nDownloading preconfigured Makefile.config${ENDCOLOR}\n"
wget https://gist.githubusercontent.com/marcfreir/008d3e509947caaa1da32070acffc57f/raw/33c5dbabf5262ecc516f420a618b7df41166ef0b/Makefile.config -O "${CWPROOT}/src/Makefile.config"

printf "${LIGHTYELLOW}\nCompiling programs${ENDCOLOR}\n"
cd "${CWPROOT}/src"
export CWPROOT=$CWPROOT
# Install needed development packages:
sudo apt install -y build-essential
# General
make install
# X-toolkit applications
make xtinstall
# Fortran codes
make finstall
# Mesa/OpenGl
make mglinstall
# Utils
make utils
# Motif
make xminstall
# Improved SEGDREAD
make sfinstall

printf "${LIGHTYELLOW}\nSetting up persistent enviroment variables${ENDCOLOR}\n"
echo "export CWPROOT='${CWPROOT}'" >>"${SHELL_CONFIG_FILE}"
echo 'export PATH="${PATH}:${CWPROOT}/bin"' >>"${SHELL_CONFIG_FILE}"

# Update & Upgrade System
printf "\nThe system may need to be Updated and Upgraded\n"
sudo apt update -y
sudo apt upgrade -y

printf "${LIGHTYELLOW}\nDone installing${ENDCOLOR}\n"

printf "${LIGHTYELLOW}\nMaybe you need to reload your current shell to be able to run SU by running the command: exit${ENDCOLOR}\n"
printf "${MAGENTA}\n$ source %s${ENDCOLOR}\n" "${SHELL_CONFIG_FILE}"

printf "${LIGHTYELLOW}\nAfter exiting this WSL window, then, you can run the following command to test if the installation is working${ENDCOLOR}\n"
printf "\n$ suplane | suximage title='test'\n\n"

### OLD ### printf "\nYOU NEED TO START XLaunch FIRST AND CHECK Disable access control \n"



# Finally
echo "export DISPLAY=:0" >> .bashrc
echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0" >> .bashrc
source .bashrc

xeyes &
printf "\nAn instance of XEYES should appear. Make shure the mouse pointer is working \n"
exit 0
