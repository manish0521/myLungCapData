
#clear Global Environment
rm(list=ls())

library(dplyr) 
library(tidyverse)
library(psych)
library(modeest)
library(MASS)

# Importing the data
#import .txt as table
data <-read.table(file.choose(), header = T)
data

dim(data)
head(data)
tail(data)
summary(data)


describe(data)

#subsetting 
cdata= data[data$Gender == "female",]
head(cdata)

#subsetting with & operator
cdata= data[data$Gender == "male" & data$Smoke== "yes", ]
head(cdata)


#using subsets of data
x = subset(data, Gender == "female" & Smoke == "no")
x

#using filter function from library dplyr
   
y = filter(data, Smoke == "no", Gender == "female", Age == 6)
head(y)

theme_set(theme_bw())
options(stringsAsFactors = FALSE)
rm(list=ls())

 
#################################creating pipeline 
lungCapacity <- data %>%
  filter(Age > 4) %>%
  group_by(Gender) %>%
  #using summarize function for creating new columns and assigning values to it
  summarise(total_gender=length(Gender), sum_capacity=sum(LungCap), avg_capacity=(sum_capacity/total_gender))

#calling created pipline to show data on console
lungCapacity


#calculating average with function

lungCapacityAvg <- data %>%
  filter(Age > 4) %>%
  group_by(Gender) %>%
  #using summarize function for creating new columns and assigning values to it
  summarise(avgLungCap=mean(LungCap))

view(lungCapacityAvg)

data1 <- data %>%
  mutate(Weight = 120)

lungCapacity1 <- data %>%
  group_by(Gender) %>%
  filter(Age > 4) 

################################ Pipeline End ###################################

######### measures of central tendency###########

mysample <- data[sample(1:nrow(data), 20, replace=FALSE),]
mysample

mysample2 <- data[sample(1:nrow(data), 300, replace=FALSE),]
mysample2

mysample$Height<-round(mysample$Height, digits = 0)

# Subsetting data
newdata <- subset(data, Age>5 && Age<20, select = c(LungCap:Caesarean))
newdata

mysample <- d[sample(1:nrow(d), 20, replace=FALSE),] #random 20 rows
mysample

dim(mysample)
describe(mysample)

# attach(mysample)
# round(mysample, digits = 1)

head(mysample)
summary(mysample)

#mode for age
mfv(mysample$Age)
#########################Varience#########################
#finding variance 1 
dists <- mysample$Height - mean(mysample$Height)
dists

sqrd_dists <- (dists)^2
sqrd_dists

#Add them all together 2
sum_sqrd_dists <- sum(sqrd_dists)
sum_sqrd_dists

#Finally 3, divide them by num of data points -1 (20obsv -1)
varBySetps = sum_sqrd_dists/19

#finding variance in one step
var(mysample$Height)

#########################END#########################

#barplot of sample dataframe and whole dataset
barplot(mysample$Age)
barplot(data$Age)

# scatterplot
splot <-mysample[, c('Age', 'Height')]
head(splot)

plot(x=mysample$Age, y=mysample$Height, xlab = "Age", ylab = "Height", xlim = c(0,30), ylim = c(40, 90), main = "Age vs Height")

#look into different syntax features
?scatter.hist

############## standard deviation #################
# SD = sqrt(variance)
sqrt(var(mysample$Height)) 
# OR
sd(mysample$Height) #preferred

################ MAD (MEAN ABSOLUTE DEVIATION) ##################
## MEAN ABSOLUTE DEVIATION - Takes the absolute value of the distances to the mean, and then takes
# the mean of those differences
dis <- mysample$Height - mean(mysample$Height)
mean(abs(dis))
describe(mysample)

## QUARTILES - Split up the data in to 4 equal parts
quantile(mysample$Height)
# This means 25% of the data is between height 53 and 62.
# Another 25% is between 62 and 66 and so on.
# Second Quartile/ 50th Percent = Median


#BOX PLOT
ggplot(mysample, aes(y= Height)) + geom_boxplot()


#Quantile
quantile(mysample$Height, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1))
#OR
quantile(mysample$Height, probs = seq(0, 1, 0.2)) #seq(from, to, by)

# aka percentiles, are a generalized version of quartiles.They can split the data into 5 or 10 pieces
# By default the "quantile" function returns the quartiles of the data but we canadjust this by "probs' or "seq"
quantile(mysample$Height, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1))
#OR
quantile(mysample$Height, probs = seq(0, 1, 0.1)) #seq(from, to, by)


## INTERQUARTILE RANGE
#It is the distance between the 25th and 75th percentile, which is also he height of the box in boxplot
quantile(mysample$Height, 0.75) - quantile(mysample$Height, 0.25)

#frequency distribution 
smoking = mysample$Smoke
smoking.freq = table(smoking)
smoking.freq

#getting results into a column
cbind(smoking.freq)

genders = mysample$SGender
#We apply the table function to compute the frequency distribution of the Smoke variable.
genders.freq = table(genders)
#The frequency distribution of the Smoke is:
genders.freq
#We apply the cbind function to print the result in column format.
cbind(genders.freq)
genders = mysample$Gender
#We apply the table function to compute the frequency distribution of the Smoke variable.
genders.freq = table(genders)
#The frequency distribution of the Smoke is:
genders.freq
#We apply the cbind function to print the result in column format.
cbind(genders.freq)


#Boxplot
boxplot(genders.freq)
colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan") 
barplot(genders.freq, col=colors)
colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan")
barplot(genders.freq, col=colors)


## Cumulative Frequency Distribution
# A Cumulative Distribution focuses on the number or percentage of cases that
# lie below or above specified values rather than within intervals.
#The cumulative frequency distribution of a quantitative variable is a 
#summary of data frequency below a given level.
agefd = mysample$Age

breaks = seq(3, 19, by=2)

agefd.cut = cut(agefd, breaks, right=FALSE)

agefd.freq = table(agefd.cut)

# We then apply the cumsum function to compute the cumulative frequency distribution.
agefd.cumfreq = cumsum(agefd.freq)

?cumsum

# The cumulative distribution for Age distribution is
agefd.cumfreq

#We apply the cbind function to print the result in column format.
cbind(agefd.cumfreq)

#Cummulative frequency graph
cumfreq0 = c(0, cumsum(agefd.freq)) 
plot(breaks, cumfreq0, main="Age distribution",xlab="Age in years", ylab="Cumulative freq") 
lines(breaks, cumfreq0) #Join the points
#####################################