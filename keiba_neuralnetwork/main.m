function [op_result test_op_result] = main(X, data)

% Xのパラメータの正規化
size(X)
X = featureNormalize(X)
% Yのデータを取得
y = data(:, size(data, 2));

% トレーニングセット、クロスバリデーションセット、テストセットにデータを分割
training_size = 10;
cv_size = 100;
test_size = 100;
[X, y, Xval, yval, Xtest, ytest] = divideData(X, y, training_size, cv_size, test_size);

%% =========== Part 1: Randomly Initialize weights ===========
% 入力層数
input_layer_size = size(X, 2);
% 第2層(hidden_layer)数
hidden_layer_size = size(X, 2) + 2;
% 出力層数
num_labels = 16;
% θの初期化
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
% パラメータのアンロール
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =========== Part 2: Implement Forward Propagation =============
% implemented in nnCostFunction

%% =========== Part 3: Implement code to compute cost function J=============
% implemented in nnCostFunctio

%% =========== Part 4: Implement backprop to compute partial derivatives=============
% implemented in nnCostFunctio

%% =========== Part 5: gradient checking =============
% lambda = 0.1;
% checkNNGradients(lambda);

%% =========== Part 6: training NN=============
options = optimset('MaxIter', 50);

lambda = 0.03;

costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

% calc nn_params
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Reroll Theta1 and Theta2
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1))
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1))
%% ============= Part7: predict ===============

larger_pop_num = 5;
% evaluate training samples
odds_training = data(1 : training_size, 3:18);
race_id_training = data(1 : training_size, 1);
% [p op] = predict(Theta1, Theta2, X, larger_pop_num, odds_training);
% [training_wins training_wins_yen training_loses training_loses_yen training_hit_persentage training_result] = calcResult(p, y, odds_training, race_id_training)

% evaluate cv samples
cv_start = training_size + 1;
cv_end = training_size + cv_size;
odds_cv = data(cv_start : cv_end, 3:18);
race_id_cv = data(cv_start : cv_end, 1);
[p op] = predict(Theta1, Theta2, Xval, larger_pop_num, odds_cv);
% [wins wins_yen loses loses_yen hit_persentage result] = calcResult(p, yval, odds_cv, race_id_cv)
[op_wins op_wins_yen op_loses op_loses_yen op_hit_persentage op_result] = calcResult(op, yval, odds_cv, race_id_cv)

% evaluate test samples
test_start = cv_end + 1;
test_end = cv_end + test_size;
odds_test = data(test_start : test_end, 3:18);
race_id_test = data(test_start : test_end, 1);
[p op] = predict(Theta1, Theta2, Xtest, larger_pop_num, odds_test);
% [wins wins_yen loses loses_yen hit_persentage result] = calcResult(p, ytest, odds_test, race_id_test);
[test_op_wins test_op_wins_yen test_op_loses test_op_loses_yen test_op_hit_persentage test_op_result] = calcResult(op, ytest, odds_test, race_id_test);
end




