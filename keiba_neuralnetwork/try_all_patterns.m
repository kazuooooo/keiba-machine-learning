% MultiClassification
%% =========== Prepare Data =============
% データをロード
data = load('machine_learning_data');
% shuffle data
data = data(randperm(size(data,1)),:);

% Xのデータを取得
X_odds = data(:, 3:18);
X_dist = data(:,19);
X_course = data(:, 20);
X_course_condition = data(:, 21);
X_rotation = data(:,22);
X_weather = data(:,23);
X_horce_num = data(:, 24:39);
%
op_cv_results_wins_yen = zeros(1, 8);
op_cv_hit_percentage = zeros(1, 8);
op_test_results_wins_yen = zeros(1, 8);
op_test_hit_percentate = zeros(1, 8);
x = 1:8;
% オッズのみ(6C0 = 1パターン)
% [op_cv_results_wins_yen(1, 1), op_test_results_wins_yen(1, 1)] = main(X_odds, data)
% 2つ選択(6C1 = 6パターン)
% [op_cv_results_wins_yen(1, 2), op_test_results_wins_yen(1, 2)] = main([X_odds X_dist], data)
% [op_cv_results_wins_yen(1, 3), op_test_results_wins_yen(1, 3)] = main([X_odds X_course], data)
% [op_cv_results_wins_yen(1, 4), op_test_results_wins_yen(1, 4)] = main([X_odds X_course_condition], data)
% [op_cv_results_wins_yen(1, 5), op_test_results_wins_yen(1, 5)] = main([X_odds X_rotation], data)
% [op_cv_results_wins_yen(1, 6), op_test_results_wins_yen(1, 6)] = main([X_odds X_weather], data)
% [op_cv_results_wins_yen(1, 7), op_test_results_wins_yen(1, 7)] = main([X_odds X_horce_num], data)
% 31560   32730   31690    1630   28840   18180   43310
%         dist    course                          horce_num
X = [X_odds X_dist X_course X_horce_num]
[op_cv_results_wins_yen(1, 8), op_test_results_wins_yen(1, 8)] = main([X_odds X_dist X_course X_horce_num], data)
op_cv_results_wins_yen .+ op_test_results_wins_yen
plot(x, op_cv_results_wins_yen, "k");
hold on;
plot(x, op_test_results_wins_yen);
% 3つ選択(6C2 = 15パターン)

% 4つ選択(6C3 = 80パターン)

% 5つ選択(6C4 = 15パターン)

% 6つ選択(6C5 = 6パターン)

% 7つ選択(6C6 = 1パターン)
