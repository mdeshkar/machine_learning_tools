# Classification Model


# K-Nearest Neighbor

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[,3:5]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 3/4)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting the KKN to the dataset
# Create your regressor here
# install.packages('class')
library(class)
y_pred = knn(train = training_set[,-3],
             test = test_set[,-3],
             cl = training_set[,3],
             k=5)

# Predict the Test Set Results
prob_pred = predict(classifier,type = 'response', newdata = test_set[-3])
y_pred = ifelse(prob_pred > 0.5 , 1,0)

# Making the confusion Matrix
cm = table(test_set[,3],y_pred)

# Visualizing the KKN training set
#install.packages("ElemStatLearn")
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[,1]) - 1,max(set[,1]) + 1 , by=0.01)
X2 = seq(min(set[,2])-1,max(set[,2])+2,by=0.01)
grid_set = expand.grid(X1,X2)
colnames(grid_set)= c('Age','EstimatedSalary')
y_grid = knn(train = training_set[,-3],
                       test = grid_set,
                       cl = training_set[,3],
                       k=5)

plot(set[,-3],
     main = "KNN (Training Set)",
     xlab = 'Age',ylab = "Estimated Salary",
     xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set,pch ='.',col = ifelse(y_grid ==1,'springgreen3','tomato'))
points(set,pch = 21, bg = ifelse(set[,3]==1,'green4','red3'))

# Visualizing the testing set set
#install.packages("ElemStatLearn")
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[,1])-1,max(set[,1])+1, by=0.01)
X2 = seq(min(set[,2])-1,max(set[,2])+1, by=0.01)
grid_set = expand.grid(X1,X2)
colnames(grid_set)= c('Age','EstimatedSalary')
y_grid = knn(train = training_set[,-3],
             test = grid_set,
             cl = training_set[,3],
             k=5)

plot(set[,-3],
     main = "KNN (Testing Set)",
     xlab = 'Age',ylab = "Estimated Salary",
     xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set,pch ='.',col = ifelse(y_grid ==1,'springgreen3','tomato'))
points(set,pch = 21, bg = ifelse(set[,3]==1,'green','red3'))





