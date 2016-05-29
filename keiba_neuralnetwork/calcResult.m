function [wins wins_yen loses loses_yen hit_percentage result] = calcResult(bet_populations, y, odds, race_id)
  result = 0;
  wins = 0;
  wins_yen = 0;
  loses = 0;
  loses_yen = 0;
  race_size = size(y, 1);
  hit_percentage = 0;
  % 複数同時にかけられるようにしておく
  bet_horces_size = size(bet_populations, 2);
  % どれかが当たっていたら1はずれは0
  bet_result = sum(bet_populations == y, 2);
  for i = 1:race_size
    if bet_result(i) == 1
      wins_yen += odds(i, y(i)) * 100;
      wins += 1;
      % fprintf('Win: %i \nWinrace_id: %i odds: %f\n', i, race_id(i), odds(i, y(i)));
    else
      loses += 1;
    end
    loses_yen -= bet_horces_size * 100;
  end
  wins = wins;
  wins_yen = wins_yen;
  loses = loses;
  loses_yen = loses_yen;
  hit_percentage = (wins / (wins + loses)) * 100;
  result = wins_yen + loses_yen;
end
