function[y]=nearest_points(size_of_dataset,num_of_similar_points,position_of_centroid,hist_database)

dist=zeros(size_of_dataset(1),1);
k=1;
for idx=1:size_of_dataset
    
    dist(k)=sum(abs(position_of_centroid-hist_database(idx,:)));  %euclidean distance
    k=k+1;
end

[~, index_2]=sort(dist);
index_3=index_2(1:num_of_similar_points);
y=index_3;
end

