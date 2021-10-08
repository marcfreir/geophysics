# Content Evaluation Activity (CEA) 1
# Developer: Marc Freir
# E-mail: marcfreir@outlook.com
# Created on: October 8, 2021
# Last update: October 8, 2021

print("\nStarting point...")

"""
1. Write a algorithm to each exercise:
a) Calculate the average value for four given numbers.
b) Go from your home to the campus.
c) Solve the equation y = 2x² + 1, for values of x, from 0 to 5. Show the graph.
"""

# a)
print("Enter the first number")
first = input()
print("Enter the second number")
second = input()
print("Enter the third number")
third = input()
print("Enter the fourth number")
fourth = input()

sumValues = (int(first)+int(second)+int(third)+int(fourth))
division = (sumValues/4)

print("%f"%division)

print("\nEnd point...")

# b)
"""
 1: go to the bus station
 2: take the money
 3: buy the ticket
 4: change --> (ticket - money)
 5: [while] the bus doesn't arrive, [do it]
 6:     wait for the bus
 7: [end-while]
 8: get on the bus
 9: authenticate ticket
10: check the seat
11: [while] you can't find the seat, [do it]
12:     go to the next seat
13:     [if] teh seat was found [then]
14:         sit on the seat
15:     [end-if]
16:     stop going to the next seat
17: [end-while]
18: sit
19: whait for the bus to arrive in tha city
20: get up from the seat
21: get off the bus
22: walk to the campus

"""

# c)
x = [0,1,2,3,4,5]
for e in x:
    y = (2*(e**2)+1)
    print(y)