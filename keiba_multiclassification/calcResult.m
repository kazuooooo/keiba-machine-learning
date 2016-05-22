function [wins loses result] = calcResult(bet_populations, y, odds)
  result = 0;
  wins = 0;
  loses = 0;
  race_size = size(y, 1);
  % 複数同時にかけられるようにしておく
  bet_horces_size = size(bet_populations, 2);
  % どれかが当たっていたら1はずれは0
  bet_result = sum(bet_populations == y, 2);
  for i = 1:race_size
    if bet_result(i) == 1
      wins += odds(i, y(i)) * 100;
    else
      loses -= bet_horces_size * 100;
    end
  end
  wins = wins
  loses = loses
  result = wins + loses
end
