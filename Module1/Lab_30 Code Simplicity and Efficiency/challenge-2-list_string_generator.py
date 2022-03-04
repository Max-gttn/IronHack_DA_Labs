#!/usr/bin/env python
# coding: utf-8

# In[48]:


# import libraries first
import random
import sys

def RandomStringGenerator(min_str_len, max_str_len):
    #define local variables first with explicit names
    list_characters=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']
    random_len = random.choice(range(min_str_len, max_str_len))
    string = ''

    #generate random string
    while len(string) < random_len:
        string += random.choice(list_characters)           
    
    return string
        
def BatchStringGenerator():
    # define local variables first with explicit names
    random_list = []
    num_str = int(input('How many random strings to generate? '))
    min_str_len = int(input('Enter minimum string length: '))
    max_str_len = int(input('Enter maximum string length: '))
    
    #make sure min_str_len > max_str_len
    if min_str_len > max_str_len: 
        sys.exit("Incorrect min and max string lengths. Try again.")

    #create list of random strings
    for i in range(num_str):
        random_list.append(RandomStringGenerator(min_str_len,max_str_len))
    
    return random_list

BatchStringGenerator()


# In[ ]:




