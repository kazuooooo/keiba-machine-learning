function [wins wins_yen loses loses_yen result] = calcResult(bet_populations, y, odds)
  result = 0;
  wins = 0;
  wins_yen = 0;
  loses = 0;
  loses_yen = 0;
  race_size = size(y, 1);
  % 複数同時にかけられるようにしておく
  bet_horces_size = size(bet_populations, 2);
  % どれかが当たっていたら1はずれは0
  bet_result = sum(bet_populations == y, 2);
  for i = 1:race_size
    if bet_result(i) == 1
      wins_yen += odds(i, y(i)) * 100;
      wins += 1;
    else
      loses_yen -= bet_horces_size * 100;
      loses += 1;
    end
  end
  wins = wins;
  wins_yen = wins_yen
  loses = loses;
  loses_yen = loses_yen
  result = wins_yen + loses_yen
end
