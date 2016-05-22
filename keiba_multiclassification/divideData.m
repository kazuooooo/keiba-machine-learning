function [X, y, Xval, yval, Xtest, ytest] = divideData(all_X, all_y, training_size, cv_size, test_size)
  cv_start_index   = training_size + 1;
  cv_end_index     = training_size + cv_size;
  test_start_index = cv_end_index + 1;
  test_end_index   = cv_end_index + test_size;

  X     = all_X(1:training_size, :);
  y     = all_y(1:training_size, :);
  Xval  = all_X(cv_start_index:cv_end_index, :);
  yval  = all_y(cv_start_index:cv_end_index, :);
  Xtest = all_X(test_start_index:test_end_index, :);
  ytest = all_y(test_start_index:test_end_index, :);
end
