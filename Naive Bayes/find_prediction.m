function [ predicted_output ] = find_prediction(input,prior_one,prior_zero,n,m,count_wi_given_one,count_wi_given_zero )
    predicted_output=zeros(m,1);
    for i=1:m
        ad=input(i,:);
        features=find(ad~=0);
        values_for_one = count_wi_given_one(1,features);
        count_y_for_one=sum(count_wi_given_one);
        values_for_zero = count_wi_given_zero(1,features);
        count_y_for_zero=sum(count_wi_given_zero);
        final_values_for_one=(values_for_one + 1)/(count_y_for_one + n);
        final_value_for_zero=(values_for_zero + 1)/(count_y_for_zero + n);
        likelihood_for_one=prod(final_values_for_one);
        likelihood_for_zero=prod(final_value_for_zero);
        approx_probability_one=likelihood_for_one*prior_one;
        approx_probability_zero=likelihood_for_zero*prior_zero;
        if approx_probability_one >approx_probability_zero
            predicted_output(i)=1;
        else
            predicted_output(i)=0;
        end
    end

end

