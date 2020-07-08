#import pandas as pd
#
#drinks = pd.read_csv('http://bit.ly/drinksbycountry', index_col='country')
#
#drinks.head()
#
#drinks.loc[0:5 , 'beer_servings']

########################### NEW DATASET #################
import pandas as pd
import matplotlib as mb

df = pd.read_csv('/Users/manish/Documents/Python/dataClass2_DataSets/ETH_1h.csv')

df.info()

df.shape # totla number of rows n column

df.head()

#this gives in 12 hr format
df['Date'] = pd.to_datetime(df['Date'], format = '%Y-%m-%d %H-%M') 
#this gives in 24 hr format
df['Date'] = pd.to_datetime(df['Date'], format = '%Y-%m-%d %I-%p') 
df['Date']

#gives day of first row
df.loc[0, 'Date'].day_name()
df['Date'].dt.day_name() # day name for each row

df['DayofWeek'] = df['Date'].dt.day_name()
df.head()


#view loldest date
df['Date'].min()

#view earlest date
df['Date'].max()

#date difference
df['Date'].max() - df['Date'].min()

###########setting date as index###############################
df.set_index('Date', inplace = True )

df.head()

#data set for 2019 
df['2019']

#difference between time frame 
df['2019-01-01' : '2020-01-01' ]

#avg time frame from dates
df['2020-01' : '2020-02' ]['Close'].mean()

#hightest value in a day
df['2020-01-01' ]['High'].max()


#max from high
df['2020-01-01' ]['High'].max()


#resampling of high column
highs = df['High'].resample('D').max()
highs

#plot graph for highs
matplotlib inline
highs.plot()


#W refers to week; D for Day  \\ graphs by data sample of week and days
week = df.resample('W').agg({'Close': 'mean', 'High': 'max', 'Low' : 'min', 'Volume' : 'sum'})
day = df.resample('D').agg({'Close': 'mean', 'High': 'max', 'Low' : 'min', 'Volume' : 'sum'})

week.plot()
day.plot()




















