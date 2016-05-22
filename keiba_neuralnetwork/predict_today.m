% predict todays race
% load Theta1
load('theta0522')

% load today data
today_X = [2.1 5.2 5.4 7.2 14.4 19.8 31.9 34.8 54.9 70.8 85.9 88.2 96.5 118.0 155.4 218.1]
larger_pop_num = 5;
p = predict(Theta1, Theta2, today_X, larger_pop_num)
