function p = predict(Theta1, Theta2, X, num, odds)
%PREDICT Predict the label of an input given a trained neural network
%   p = 単純に勝つ確率の高いもの5頭
%   op = 勝つ確率✖️オッズの値が高いもの5頭
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);
% op = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
% h2_op = h2 .* odds;
p = largerProbPops(h2, num);
% op = largerProbPops(h2_op, num);

% =========================================================================


end
