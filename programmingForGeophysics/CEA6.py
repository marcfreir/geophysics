# Content Evaluation Activity (CEA) 6
# Developer: Marc Freir
# E-mail: marcfreir@outlook.com
# Created on: October 12, 2021
# Last update: October 12, 2021

import math

print("\nStarting point...")

"""
1. Consider the following table, which presents the measured values of the intensity of the Earth's magnetic field:

    Distance | Geomagnetic intensity [nT]
        0    |       22552.28
       10    |       22459.19
       20    |       22327.74
       30    |       22162.75
       40    |       22034.26
       50    |       22021.8
       60    |       22139.7
       70    |       22277.8
       80    |       22353.96
       90    |       22433.4

a) Put the geomagnetic distance and intensity values as the x and y arrays, respectively.
b) What is the command to extract the value of the third geomagnetic measure?
c) What is the command to extract the value of the fourth measurement position?
d) What is the command to extract the values of the third to sixth geomagnetic measurement?
e) What is the command to extract the values of the first, ninth, third and sixth geomagnetic measurement simultaneously?

"""

# 1.

## a)
x = [0,10,20,30,40,50,60,70,80,90]
y = [22552.28,22459.19,22327.74,22162.75,22034.26,22021.8,22139.7,22277.8,22353.96,22433.4]

## b)
y[2]
print(y[2])

## c)
y[4]
print(y[4])

## d)
y[2:6]
print(y[2:6])

## e)
indices_to_access = [0,8,2,5]
accessed_mapping = map(y.__getitem__, indices_to_access)
accessed_list = list(accessed_mapping)
print(accessed_list)


print("\nEnd point...")