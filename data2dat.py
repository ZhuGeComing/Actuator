
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import datetime
import os
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import sys
if(len(sys.argv) == 2):
    a = eval(sys.argv[1])
else:
    a = '.'

def change_data(home = '.'):
    dir_names = []  
    f_list = os.listdir(home)
    for i in f_list:
        if(os.path.splitext(i)[1] == '.data'):
            print(i)
#             pass
            os.rename(home+'/'+i, home+'/'+os.path.splitext(i)[0]+'.dat')  
          
        if not os.path.splitext(i)[1]:
            dir_names.append(home+'/'+i)
    for j in dir_names:
        change_data(j)
#     print(sub_files)


if __name__ == '__main__':

        change_data(a)            

