# Hirarchycal Clustering

#Importing the mall dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]

#Using the dendogram to find the optimal number of clusters
dendrogram = hclust(dist(X,method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Eucledian Distance')

# Fitting hierarchical clustering to the mall dataset:
hc = hclust(dist(X,method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc,5)

#Visualizing the Hierarchical Cluster
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = T,
         labels = 6,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Clusters of Clients"),
         xlab = "Annual Income",
         ylab = "Spending Score")











