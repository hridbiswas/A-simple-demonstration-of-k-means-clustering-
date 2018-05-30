function [y]=distance_from_testpoint_to_centroid(num_of_cluster,t,C)
dist=zeros(num_of_cluster,1);
k=1;
for idx=1:num_of_cluster
    
    dist(k)=sum(abs(t-C(idx,:)));  %euclidean distance
    k=k+1;
end


[distance_1, index_1]=sort(dist);
y=index_1;
end