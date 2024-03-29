# Data Processing

# Importing the dataset

dataset = read.csv('Data.csv')
# dataset = dataset[,2:3]


# Identifying the missing values
# dataset$Age = ifelse(is.na(dataset$Age),ave(dataset$Age,FUN = function(x)mean(x,na.rm=TRUE)),
#                      dataset$Age)
# 
# dataset$Salary = ifelse(is.na(dataset$Salary),ave(dataset$Salary,FUN = function(x)mean(x,na.rm = T))
#                         ,dataset$Salary)

# Encoding categorical data

# dataset$Country = factor(dataset$Country,
#                          levels = c('France','Spain','Germany'),
#                          labels = c(1,2,3))
# dataset$Purchased = factor(dataset$Purchased,
#                            levels = c('No','Yes')
#                            ,labels = c(0,1))
# Spliting the dataset into the training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.8)
training_set = subset(dataset,split==T)
testing_set = subset(dataset,split==F)

# Feature Scalling
# training_set[,c(2,3)] = scale(training_set[,c(2,3)])
# testing_set[,c(2,3)] = scale(testing_set[,c(2,3)])

