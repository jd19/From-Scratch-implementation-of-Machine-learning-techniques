function runknn(train_data,train_label,test_data,test_label)
    neighbours = [1 3 5 7 9 11 13 15 17];
    n = numel(neighbours);
    accuracy = zeros(1,n);
    r =size(train_data,1);
    rand_indices = randperm(r,r);
    for i =1:n
        %%cross_val
        s =0;
        for c =1:5
            start = (1000*(c-1) + 1);
            en = c*1000; 
            te_data = train_data(rand_indices(start:en),:);
            te_label = train_label(rand_indices(start:en),:);
            tr_data = train_data(setdiff(1:r,rand_indices(start:en)),:);
            tr_label = train_label(setdiff(1:r,rand_indices(start:en)),:);
            m = numel(te_label);
            prediction  = zeros(m,1);
            for j = 1:m
                testdata = te_data(j,:);
                knn = findknn(neighbours(i),tr_data,tr_label,testdata);
                prediction(j) = mode(knn);
            end 
            acc = mean(double(prediction == te_label)) * 100;
            s =s + acc;
        end
        accuracy(i) = s/5;
        %%cross_val
    end
    figure();
    plot(neighbours,accuracy);
    xlabel("Number of neighbours");
    ylabel("Accuracy"); 
    neighbours
    accuracy
    [~,ind]= max(accuracy);
    disp(["The maximum accuracy is coming with neighbours :-", (2*(ind-1))+1]);
    k = (2*ind)+1;
    m = numel(test_label);
    prediction  = zeros(m,1);
    for j = 1:m
        testdata = test_data(j,:);
        knn = findknn(k,train_data,train_label,testdata);
        prediction(j) = mode(knn);
    end 
    acc = mean(double(prediction == test_label)) * 100;
    disp(["accuracy on the test data is :-",acc]);
    
end