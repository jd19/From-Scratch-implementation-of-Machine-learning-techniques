function [accuracy]=runknn(images,labels,testimages,testlabels)
    neighbours = [1 3 5 10 30 50 70 80 90 100];
    m = numel(testlabels);
    n = numel(neighbours);
    prediction  = zeros(m,1);
    accuracy = zeros(1,n);
    for i =1:n
        for j = 1:m
            testimage = testimages(j,:);
            knn = findknn(neighbours(i),images,labels,testimage);
            prediction(j) = mode(knn);
        end 
        accuracy(i) = mean(double(prediction == testlabels)) * 100;
    end
    plot(neighbours,accuracy);
end