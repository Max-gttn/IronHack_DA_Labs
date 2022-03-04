#!/usr/bin/env python
# coding: utf-8

# In[11]:




# In[4]:


import streamlit as st

import pandas as pd
import numpy as np

import matplotlib.pyplot as plt

from sklearn import datasets

pd.set_option("display.max_columns", 50)

st.title('Breast Cancer Stats')


# In[5]:
st.write("Texture vs Area")

breast_cancer = datasets.load_breast_cancer(as_frame=True)

breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)

breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]

breast_cancer_df.head()


# In[6]:
st.write("Average Measurements per Tumor Type")


scatter_fig = plt.figure(figsize=(8,7))

scatter_ax = scatter_fig.add_subplot(111)

malignant_df = breast_cancer_df[breast_cancer_df["target"] == "malignant"]
benign_df = breast_cancer_df[breast_cancer_df["target"] == "benign"]

malignant_df.plot.scatter(x="mean texture", y="mean area", s=120, c="tomato", alpha=0.6, ax=scatter_ax, label="Malignant")
benign_df.plot.scatter(x="mean texture", y="mean area", s=120, c="dodgerblue", alpha=0.6, ax=scatter_ax,
                       title="Mean Texture vs Mean Area", label="Benign");


# In[7]:


avg_breast_cancer_df = breast_cancer_df.groupby("target").mean()

avg_breast_cancer_df


# In[8]:


bar_fig = plt.figure(figsize=(8,7))

bar_ax = bar_fig.add_subplot(111)

sub_avg_breast_cancer_df = avg_breast_cancer_df[["mean radius", "mean texture", "mean perimeter", "area error"]]

sub_avg_breast_cancer_df.plot.bar(alpha=0.8, ax=bar_ax, title="Average Measurements per Tumor Type");


# In[9]:


hist_fig = plt.figure(figsize=(8,7))

hist_ax = hist_fig.add_subplot(111)

sub_breast_cancer_df = breast_cancer_df[["mean radius", "mean texture"]]

sub_breast_cancer_df.plot.hist(bins=50, alpha=0.7, ax=hist_ax, title="Average Measurements per Tumor Type");


# In[10]:


hexbin_fig = plt.figure(figsize=(8,7))

hexbin_ax = hexbin_fig.add_subplot(111)

breast_cancer_df.plot.hexbin(x="mean texture", y="mean area",
                             reduce_C_function=np.mean,
                             gridsize=25,
                             #cmap="Greens",
                             ax=hexbin_ax,
                             title="Concentration of Measurements"
                            );


# In[ ]:




