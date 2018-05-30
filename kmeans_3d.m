clear all;
close all;
clc;
rng default; 
X = [randn(200,3)*0.75+ones(200,3);
    randn(200,3)*0.5-ones(200,3)];
size_of_dataset=size(X);


figure;
plot3(X(:,1),X(:,2),X(:,3),'.');

title 'Randomly Generated Data';
num_of_cluster=3;
[idx,C] = kmeans(X,num_of_cluster,'Distance','cityblock');  % idx shows which observation belongs to which class and C shows the position of the centroid.
%thats why for 2 cluster and 2 dimensional data, C is 2*2 matrix

%take test point

 t=[-1.5071 -0.7502 -0.6023]


figure;
plot3(X(idx==1,1),X(idx==1,2),X(idx==1,3),'r.','MarkerSize',12)
hold on
plot3(X(idx==2,1),X(idx==2,2),X(idx==2,3),'b.','MarkerSize',12)
plot3(X(idx==3,1),X(idx==3,2),X(idx==3,3),'y.','MarkerSize',12)


 
 plot3(C(:,1),C(:,2),C(:,3),'kx','MarkerSize',15,'LineWidth',3) 
 
 
 
 
 plot3(t(:,1),t(:,2),t(:,3),'g*','MarkerSize',15);
legend('Cluster 1','Cluster 2','cluster 3','Centroids','Test sample')
title 'Visualization of Clustering Problem'
hold off




%calculate distance from test point to all centroid


centroid=distance_from_testpoint_to_centroid(num_of_cluster,t,C); %it gives index nearest centroid

position_of_centroid=C(centroid(1),:); %first index will give the nearest centroid(one centroid)

% find nearest points to the centroid

num_of_similar_points=5
index=nearest_points(size_of_dataset,num_of_similar_points,position_of_centroid,X)
%show similar results
similar_points=X(index,:)