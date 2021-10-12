# Content Evaluation Activity (CEA) 4
# Developer: Marc Freir
# E-mail: marcfreir@outlook.com
# Created on: October 12, 2021
# Last update: October 12, 2021

print("\nStarting point...")

"""
1. Consider the following variables:

    a = 5.39
    b = 1.15
    c = 3
    x = 2.3663
    y = 8
    z = 7.23

a) Solve: 6[(abc)/(xyz)] - 3, and show the result with 2 decimal places.
b) Solve: 5x+y² - b/y, and show the result with 14 decimal places.
c) Solve: z^(3c) - y/3x + 92a, and show the result witn 4 decimal places.

"""

# 1.

a = 5.39
b = 1.15
c = 3
x = 2.3663
y = 8
z = 7.23

## a)
ansA = (6*((a*b*c)/(x*y*z))-3)
print("%.2f" %ansA)
## b)
ansB = ((5*x)+(y**2)-(b/y))
print("%.14f" %ansB)
## c)
ansC = ((z**(3*c))-(y/3*x)+(92*a))
print("%.4f" %ansC)


print("\nEnd point...")