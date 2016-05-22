function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
%
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
X = [ones(size(X, 1), 1) X];
for i = 1:m
  % i番目のサンプル行を取得
  XI = X(i, :);
  % 前に計算を進める
  % layer2
  z_two = sum(Theta1 .* XI, 2);
  a_two = (sigmoid(z_two))';

  % layer3
  a_two = [ones(size(a_two, 1), 1) a_two];
  z_three = sum(Theta2 .* a_two, 2);
  a_three = sigmoid(z_three);

  HX = a_three;

  % yの結果[0; 0; 0; 1; 0; 0;...0;]のようなをベクトルの形に直す
  nums = [1:size(a_three,1)];
  y_vectored =  (nums == y(i))';

  % コストを計算
  J = J + sum(-y_vectored .* log(HX) - (1 - y_vectored) .* log(1 - HX));
end

% without regularization
J = 1/m * J;

% add regularization
reg = 0;
theta1_without_bias = [Theta1(:,2:end)];
theta2_without_bias = [Theta2(:,2:end)];
reg = (lambda/(2 * m)) * (sum(sum(theta1_without_bias.^2),2) + sum(sum(theta2_without_bias.^2),2));

% with regularization
J = J + reg;

%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the
%               first time.
%

large_delta_2 = zeros(size(Theta2));
large_delta_2_bias = Theta2;
large_delta_2_bias(:,1) = 0;
large_delta_1 = zeros(size(Theta1));
large_delta_1_bias = Theta1;
large_delta_1_bias(:,1) = 0;
for t = 1:m
  % step1
  % i番目のサンプル行を取得
  a1 = X(t, :);
  % 前に計算を進める
  % layer2
  z2 = sum(Theta1 .* a1, 2);
  a2 = (sigmoid(z2))';

  % layer3
  a2 = [ones(size(a2, 1), 1) a2];
  z3 = sum(Theta2 .* a2, 2);
  a3 = sigmoid(z3);

  % step2
  % yの結果[0; 0; 0; 1; 0; 0;...0;]のようなをベクトルの形に直す
  nums = [1:size(a3, 1)];
  y_vectored =  (nums == y(t))';
  delta3 = a3 - y_vectored;

  % step3
  delta2 = Theta2(:, 2:end)' * delta3 .* sigmoidGradient(z2);

  % step4
  % △ijを足していく
  large_delta_2 = large_delta_2 + delta3 .* a2;
  large_delta_1 = large_delta_1 + delta2 .* a1;
end

Theta1_grad = large_delta_1 / m + lambda/m .* large_delta_1_bias;
Theta2_grad = large_delta_2 / m + lambda/m .* large_delta_2_bias;

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
