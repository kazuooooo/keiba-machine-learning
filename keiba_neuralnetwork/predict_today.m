% predict todays race
% load Theta1
load('theta0522')

% load today data
row_X = [2.0 5.3 5.7 7.7 14.9 15.9 35.3 38.5 61.8 80.0 92.3 100.2 101.4 146.1 183.5 240.4]
today_X = featureNormalize(row_X);
larger_pop_num = 5;
p = predict(Theta1, Theta2, today_X, larger_pop_num)
