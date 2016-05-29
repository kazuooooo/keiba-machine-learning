% データを準備
data = load('machine_learning_data20160529-04:07')

% Xのデータを取得
X_odds = data(:, 3:18);
X_dist = data(:,19);
X_course = data(:, 20);
X_course_condition = data(:, 21);
X_rotation = data(:,22);
X_weather = data(:,23);
X_horce_num = data(:, 24:39);
X = [X_odds X_dist X_course X_horce_num];

% yのデータを準備
% y = data(:, size(data, 2))

% thetaの値をロード
% theta0529-5はすごいよさそう入力はX = [X_odds X_dist X_course X_horce_num];
load('theta0529-5');

% evaluate cv sam
larger_pop_num = 5;
% race_id = data(:, 1);
% pですら1番人気を全く予想しないのはおかしいんじゃ？？
[p op] = predict(Theta1, Theta2, X, larger_pop_num, X_odds)
p_with_id = [data(:, 1:2) p]
op_with_id = [data(:, 1:2) op]
%[p_wins p_wins_yen p_loses p_loses_yen p_hit_persentage p_result] = calcResult(p, y, X_odds, race_id)
%[op_wins op_wins_yen op_loses op_loses_yen op_hit_persentage op_result] = calcResult(op, y, X_odds, race_id)
