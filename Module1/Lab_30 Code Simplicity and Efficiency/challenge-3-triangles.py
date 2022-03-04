#!/usr/bin/env python
# coding: utf-8

# In[26]:


"""
You are presented with an integer number larger than 5. Your goal is to identify the longest side
possible in a right triangle whose sides are not longer than the number you are given.

For example, if you are given the number 15, there are 3 possibilities to compose right triangles:

1. [3, 4, 5]
2. [6, 8, 10]
3. [5, 12, 13]

The following function shows one way to solve the problem but the code is not ideal or efficient.
Refactor the code based on what you have learned about code simplicity and efficiency.
"""

# add whit space around operators
def my_function():
    # add variable declaration at first
    X = int(input("What is the maximal length of the triangle side? Enter a number: "))
    solutions=[]
    
    # replace loop for generator expression
    solutions = [[x, y, z] for x in range(5, X) for y in range(4, X) for z in range(3, X) if (x * x == y * y + z * z)]
    
    # eliminate uncessary loop
    max_length = max(max(solutions))
    
    # Use the % instead of + operator in string formatting
    print("The longest side possible is %s" % (max_length))

my_function()

