function average_accuracy = main_naivebayes(input,y)
    [m,n]=size(input);
    input_fraction = [0.1 0.3 0.5 0.7 0.8 0.9];
    average_accuracy= zeros(1,6);

    for i =1:numel(input_fraction)
        sum_accuracy=0;
        for j = 1:5
            %average it out for 5 times
            %for each value of input_fraction create the input and output (X
            %and y) = (new_input and new_y)
            numelem = round(input_fraction(i)*m);
            indices = randperm(m,numelem);
            new_input = input(indices,:);
            [new_m,new_n] = size(new_input);
            new_y= y(indices);
            one_indices=find(new_y==1); 
            zero_indices=find(new_y==0);
            one_matrix=new_input(one_indices,:);
            zero_matrix=new_input(zero_indices,:);  
            prior_one = numel(one_indices) / new_m;
            prior_zero = numel(zero_indices) / new_m;
            count_wi_given_one=sum(one_matrix);
            count_wi_given_zero=sum(zero_matrix);
            prediction = find_prediction(input,prior_one,prior_zero,n,m,count_wi_given_one,count_wi_given_zero);
            accuracy=  mean(double(prediction == y)) * 100;
            sum_accuracy = sum_accuracy + accuracy;

        end

        average_accuracy(i)=sum_accuracy/5;

    end
      plot(input_fraction,average_accuracy);
end
  




