#!/usr/bin/env python
# coding: utf-8

# In[14]:


"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

#print variables ex: "<html>%s%s%s%s</html>" % (head, prologue, query, tail)
# define global variables zero=0, one=1, plus=+


# Define dictionnaries to convert input string to integer and vice-versa
number = {'zero':0,
          'one':1,
          'two':2,
          'three':3,
          'four':4,
          'five':5}         # Five numbers possibilities

answer = {-5:'negative five',
          -4:'negative four',
          -3:'negative three',
          -2:'negative two',
          -1:'negative one',
          0:'zero',
          1:'one',
          2:'two',
          3:'three',
          4:'four',
          5:'five'}  # Ten results possible

# Define functions
def calculation():
    
    print('Welcome to this calculator!')
    print('It can add and subtract whole numbers from zero to five')
       
    
    
    # check if right inputs
    numbers_possible = ['zero','one', 'two','three','four','five']
    operators_possible = ['plus','minus']
    
    while True:
        a = input('Please choose your first number (zero to five): ')
        b = input('What do you want to do? plus or minus: ')
        c = input('Please choose your second number (zero to five): ')
        if (a not in numbers_possible) or (b not in operators_possible) or (c not in numbers_possible):
            print("I am not able to answer this question. Check your input.")
        else:
            break
    
    #calculation
    if b == 'plus':
        result = number[a] + number[c]
        print("%s %s %s equals %s"%(a,b,c,answer[result]))
        print("Thanks for using this calculator, goodbye :)")
    else:
        result = number[a] - number[b]
        print("%s %s %s equals'%s"%(a,b,c,answer[result]))
        print("Thanks for using this calculator, goodbye :)")

calculation()

