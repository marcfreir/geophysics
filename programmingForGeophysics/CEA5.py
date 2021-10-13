# Content Evaluation Activity (CEA) 5
# Developer: Marc Freir
# E-mail: marcfreir@outlook.com
# Created on: October 12, 2021
# Last update: October 12, 2021

import math

print("\nStarting point...")

"""
1. Consider the following variables:

    k = 2
    m = 3
    n = 3.1416
    t = 4

a) Solve: cos(2-2k), in degrees, and show the result with 2 decimal places.
b) Solve: 9tan[1/√(k + 2^m)], and show the result with 14 decimal places.
c) Solve: 7n cos(t) + [√(3)/2 sen(m - 3)] + [2^nk - 54m] + [ln(5)/nt^8], and show the result witn 14 decimal places.

"""

# 1.

k = 2
m = 3
n = 3.1416
t = 4

## a)
ansA = (math.cos(n-(2*k)))
ansAtoDeg = (math.degrees(ansA))
print("%.2f" %ansAtoDeg)

## b)
ansB = (9*(math.tan(1/(math.sqrt(k+(2**m))))))
print("%.14f" %ansB)

## c)
ansC = ((7*n*(math.cos(t)))+((math.sqrt(3))/2*(math.sin(m-3)))+((2**(n*k))-(54*m))+((math.log(5))/(n*(t**8))))
print("%.14f" %ansC)


print("\nEnd point...")