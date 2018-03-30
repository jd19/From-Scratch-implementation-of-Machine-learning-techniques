function average_accuracy = main_logisticregression(input,y)
    [m,n]=size(input);
    scale_input=[ones(m,1) input];
    input_fraction = [0.1 0.3 0.5 0.7 0.8 0.9];
    average_accuracy= zeros(1,6);

    learning_rate=0.1;
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
            new_input=[ones(new_m,1) new_input];  
            new_y= y(indices);
            theta = zeros((new_n+1),1);
            theta=gradientdescent(new_input,new_y,theta,learning_rate,10000);
            accuracy=find_accuracy(theta,scale_input,y);
            sum_accuracy=sum_accuracy + accuracy;

        end

        average_accuracy(i)=sum_accuracy/5;

    end
      plot(input_fraction,average_accuracy);
end
  




