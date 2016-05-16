function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);
% add first 1 column
X = [ones(m, 1) X];
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


for j=1:size(p,1)
  % calc layer2
  a_two = sigmoid(sum((Theta1 .* X(j, :))'));
  a_two = [ones(size(a_two, 1)) a_two];

  % calc layer3
  a_three = sigmoid(sum((Theta2 .* a_two)'));

  % get max val
  [x ix] = max(a_three);
  p(j) = ix;
end

% =========================================================================


end
