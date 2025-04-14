import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt
import seaborn as sns
from IPython.display import display
from markdownipy import markdownipy
from IPython.display import Markdown

def render_markdown(x):
    md = markdownipy.markdownipy()
    md < x | md.h3
    display(Markdown(md.print()))


def data_check(x):
    render_markdown('First Five Rows')
    display(x.head()) 
    render_markdown('Last Five Rows')
    display(x.tail())
    render_markdown('Shape of Data')
    display(x.shape)
    render_markdown('Types of Data')
    display(x.dtypes)
    render_markdown('Data Information')
    x.info()
    render_markdown('Count of Duplicates')
    print(f'There are {x.duplicated().sum()} duplicate rows')
    render_markdown('Count of Missing Values')
    display(x.isna().sum())
    render_markdown('Count of Unique Values')
    display(x.nunique())
    render_markdown('Descriptive Statistics')
    display(x.describe())