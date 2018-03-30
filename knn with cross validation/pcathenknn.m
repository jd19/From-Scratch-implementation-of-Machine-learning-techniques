function pcathenknn(train_data, train_label, test_data, test_label)
    
    
    train_data = normalization(train_data);
    m =size(train_data,1);
    sig = (1/m) * (train_data')*(train_data);
    [u,s,v] = svd(sig);
    ufinal = u(:,1:50);
    train_datafinal = ((ufinal')*(train_data'))';
    test_datafinal = ((ufinal')*(test_data'))';
    runknn(train_datafinal, train_label, test_datafinal, test_label);    
end