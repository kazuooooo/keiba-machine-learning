%% =========== Part 1: データの準備 =============
% データをロード
data = load('machine_learning_data')

% Xのデータを取得
X = data(:, 3:(size(data, 2) - 1));
% Xのパラメータの正規化
X = featureNormalize(X);

% Yのデータを取得
y = data(:, size(data, 2));

% トレーニングセット、クロスバリデーションセット、テストセットにデータを分割
% [X, y, Xval, yval, Xtest, ytest] = divideData(X, y, 200, 200, 200)

%% =========== Part 2: ニューラルネットワークなしで一旦計算してみる ===========
% λを設定
lambda = 1;

% とりあえず定数
num_horces = 16;

% thetaをトレー二ング
theta = oneVsAll(X, y, num_horces, lambda);

%% =========== Part 3: 検証 =============
% とりあえずトレーニングデータをそのまま使う
predict_y = predictOneVsAll(theta, X);
% 当たる確率
percentage = mean(double(predict_y == y)) * 100;
fprintf('\nTraining Set Accuracy: %f\n', percentage);
%% =========== Part 4: =============

%% =========== Part 5: =============

