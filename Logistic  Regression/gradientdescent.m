function [theta J_history] = gradientdescent(new_input,new_y,theta,learning_rate,max_iter)

[m,n]=size(new_input);
J_history = zeros(max_iter, 1);
X=new_input;

y=new_y;
alpha=learning_rate;

for i = 1:max_iter
h = sigmoid(X * theta);  % hypothesis
err = h - y;    % error
gradient = (alpha/ m) * (X' * err); %update the gradient
theta = theta - gradient;
cost = costFunction(theta,new_input, new_y);
J_history(i) =cost;
 
end
end