% 確率の大きいものからnum分だけindexで取ってくる
function larger_prob_pops = largerProbPops(pred_vals, num)
  sample_num = size(pred_vals, 1);
  max_val = zeros(sample_num, 1);
  index_val = zeros(sample_num, 1);
  larger_prob_pops = zeros(sample_num, num);
  for i = 1:num
    % 最大値を取得
    [max_val, index_val] = max(pred_vals, [], 2);
    for s = 1:sample_num
      % 最大値を保存
      larger_prob_pops(s, i) = index_val(s);
      % 使った最大値を0にする
      pred_vals(s, index_val(s)) = 0;
    end
  end
end
