function [knn] = findknn(k,images,labels,testimage)

    [mtrain,ntrain]=size(images);
    [dists,ind] = sort(sqrt(sum((images - repmat(testimage, mtrain, 1)).^2, 2)));
    closest_indices=ind(1:k);
    knn=labels(closest_indices);
 
end
