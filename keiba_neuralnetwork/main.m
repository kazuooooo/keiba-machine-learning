% MultiClassification
%% =========== Prepare Data =============
% データをロード
data = load('machine_learning_data');

% Xのデータを取得
X = data(:, 8:(size(data, 2) - 1));

% 2乗のパラメータを加えてみる
% わざとoverfitさせた
% X = [X X.^2];

% Xのパラメータの正規化
X = featureNormalize(X);

% Yのデータを取得
y = data(:, size(data, 2));

% トレーニングセット、クロスバリデーションセット、テストセットにデータを分割
training_size = 300;
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
% lambda = 3;
% checkNNGradients(lambda);

%% =========== Part 6: training NN=============
options = optimset('MaxIter', 50);

lambda = 1;

costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

% calc nn_params
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Reroll Theta1 and Theta2
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

%% ============= Part7: predict ===============

larger_pop_num = 5;
odds_cv = data((training_size + 1) : (training_size + cv_size), 3:(size(data, 2) - 1));
p = predict(Theta1, Theta2, Xval, larger_pop_num, odds_cv)
[wins wins_yen loses loses_yen hit_persentage result] = calcResult(p, yval, odds_cv)

% [wins wins_yen loses loses_yen hit_persentage result] = calcResult(op, yval, odds_cv)

