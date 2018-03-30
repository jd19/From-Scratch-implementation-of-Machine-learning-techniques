function [acc] =find_accuracy(theta,input,y)
%[m,n] = size(input);
%new_input=[ones(m,1) input];
%value = theta * new_input;
value= round(sigmoid(input * theta));
acc = mean(double(value == y)) * 100;
end
