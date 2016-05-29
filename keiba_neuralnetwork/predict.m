function [p op] = predict(Theta1, Theta2, X, num, odds)
%PREDICT Predict the label of an input given a trained neural network
%   p = 単純に勝つ確率の高いもの5頭
%   op = 勝つ確率 ✖️ オッズの大きいもの5選o
%   trained weights of a neural network (Theta1, Theta2)

% Useful valuesf
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);
op = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2')
h2_op = odds .* h2
p = largerProbPops(h2, num)
op = largerProbPops(h2_op, num)
% =========================================================================


end
