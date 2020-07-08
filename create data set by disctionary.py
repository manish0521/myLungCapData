
import pandas as pd
import numpy as np

#df.isnull().sum() #gives null count



employee = {
       "first" : ["Manish", "Bill", "Ali", "Ali"],
       "last" : ["Singh", "Gates", "Khan", "Khan"],
       "email" : ["m.s@gmail.com","b.g@gmail.com","a.k@gmail.com","a.k@gmail.com" ]
        }


emp = pd.DataFrame(employee)

emp[:] #full list of everything

emp[['first', 'last']] # gives list of first and last name


emp.info() #gives how many null or not values

emp.columns # gives column index list



emp.iloc[0] #gives first rows
emp.iloc[[2]]
emp.iloc[[0,1]] # gives all info of row1 1 and 2 
emp.iloc[[0,1], 1] # with reference to 3d column 2

emp.loc[[0,1], 'last'] # with filter of  'last' name column


# len() with the index property, will only give the height of your DataFrame.
print(len(emp.index)) 


##########################
emp.loc[0, :] #gives first row and all columns. : means all column
emp.loc[0:2, :] #gives 0 through 2 rows and all columns. 

emp.loc[:, 'first'] # all rows with refrence to first name column
emp.loc[:, ['first', 'last']] # all rows with refrence to first name column and last name column
emp.loc[:, 'first' : 'email'] # all rows from first through email columns
emp.loc[0:2, 'first' : 'email']

emp.loc[emp['first']=='Manish', 'email'] # row ith first name manish and its email
#emp.loc[emp.first=='Manish', 'email'] # this symtax for notebook in jupyter

emp.loc[emp['first']=='Ali', 'email']


#.loc[] works on labels of your index. This means that if you give in loc[2], 
#you look for the values of your DataFrame that have an index labeled 2.
emp.loc[2]
#.iloc[] works on the positions in your index. 
#This means that if you give in iloc[2], you look for the values of your DataFrame that are at index ’2`.
emp.iloc[2]

#np = numpy np.array is numpy function for using array
df = pd.DataFrame(data=np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), index= [2, 'A', 4], columns=[48, 49, 50])

# Pass `2` to `loc`
print(df.loc[2])

# Pass `2` to `iloc`
print(df.iloc[2])

emp.set_index('first')

emp.reset_index(inplace=True) # gives index column and reset from 2

#********
emp['first'].map({'Dan': 'Joes', 'Rob': 'Rocier', 'Danny': 'Man' })

emp['email'].apply(len)

emp['email'].str.upper()

emp['email'] = emp['email'].str.upper() #assigning upper case to email in the dataframe
emp


emp.apply(len) #gives length of all columns


#running apply on a series, it applies to every value in the series

#gives the length of each keys in the data frame
emp.applymap(len) #it doesnot worked with indexed data which is reset or applied

emp.applymap(str.lower) # lower case for all the values



#MAP to change the values

emp['first'].map({'Bill': 'Dipen', 'Manish': 'Mango'})

emp['first'].replace({'Mango': 'Dipen', 'Dipen': 'Mango'})

#Assigining values to dataset
emp['first'] = emp['first'].map({'Bill': 'Dipen', 'Manish': 'Mango'})


#renaming column
emp.rename(columns={'email': 'email-ID'}, inplace = True ) #to apply the change u need inplace = True



#joining columns
emp['full_name'] = emp['first'] + ' ' + emp['last']
emp['full_name']


#dropping columns
emp.drop(columns = ['first', 'last'], inplace = True)
emp


emp['full_name'].str.split(' ')

emp['full_name'].str.split(' ', expand = True)

#adding back first and last column
emp[['first', 'last']] = emp['full_name'].str.split(' ', expand = True)
emp


#Adding rows uning .append
emp.append({'first': 'Braian'}, ignore_index = True)
emp.append({'first': 'Braian', 'last':'Duklner'}, ignore_index = True)

emp=emp.append({'first': 'Braian', 'last':'Duklner'}, ignore_index = True)



#Data Frame 2
employee = {
       "first" : ["Manish", "Bill"],
       "last" : ["Singh", "Gates"],
       "email" : ["m.s@gmail.com","b.g@gmail.com" ]
        }


emp2 = pd.DataFrame(employee)
emp2
emp

#Appending 2 dataframes
emp.append(emp2)
emp.append(emp2, sort = False)









