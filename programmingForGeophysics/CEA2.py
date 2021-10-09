# Content Evaluation Activity (CEA) 2
# Developer: Marc Freir
# E-mail: marcfreir@outlook.com
# Created on: October 9, 2021
# Last update: October 9, 2021

print("\nStarting point...")

"""
1. What is the result of the following operations:
a) (32/2³+1)+8
b) [3²-2/√(37)]+[8/³√(34-1)]

2. Consider the following variables:
cost = 1
Cost = 3.1521
coST = 2.1
cOSt = 8.2458

solve:

a) The square of each four variables.
b) The division of the second variable by the third variable.
c) The multiplication of the third variable squared by the first variable cubed.
"""

# 1.
## a)
print(((32/((2**3)+1)))+8)
print("\n")
## b)
print((((3**2)-(2))/(37**(1/2)))+((8)/((34**(1/3))-1)))
print("\n")

# 2.
cost = 1
Cost = 3.1521
coST = 2.1
cOSt = 8.2458

## a)
print(cost**2)
print(Cost**2)
print(coST**2)
print(cOSt**2)

print("\n")

## b)
print(Cost/coST)

print("\n")

## c)
print((coST**2)*(cost**3))


print("\nEnd point...")