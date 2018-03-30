function [knn] = findknn(k,images,labels,testimage)
    
   %{
    mtest=numel(labels);
    kimages = images(1:k,:);
    [dists,ind] = sort(sqrt(sum((kimages - repmat(testimage, k, 1)).^2, 2)));
    
    k1images =  images(k+1:mtest,:);
    [d,in] = sqrt(sum((k1images - repmat(testimage, (m-k-1), 1)).^2, 2));
    
    for i = 1:(m-k-1)
        j=k;
        while d(i)<dist(j) & j>0
            d(j)=d(j-1);
            j=j-1; 
        end            
    end
   %} 

    [mtrain,ntrain]=size(images);
    [dists,ind] = sort(sqrt(sum((images - repmat(testimage, mtrain, 1)).^2, 2)));
    closest_indices=ind(1:k);
    knn=labels(closest_indices);
 
end
