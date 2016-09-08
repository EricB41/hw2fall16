class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  player1 = game[0]
  player2 = game[1]
  raise NoSuchStrategyError unless player1[1].downcase() == "r" || player1[1].downcase() == "p" || player1[1].downcase() == "s"
  raise NoSuchStrategyError unless player2[1].downcase() == "r" || player2[1].downcase() == "p" || player2[1].downcase() == "s"
  if player1[1].downcase() == player2[1].downcase()
    return player1
  elsif player1[1].downcase() == "r"
    if player2[1].downcase() == "p"
      return player2
    else #must be scissors
      return player1
    end
  elsif player1[1].downcase() == "p"
    if player2[1].downcase() == "r"
      return player1
    else # must be scissors
      return player2
    end
  else # player1 must have chosen scissors
    if player2[1].downcase() == "r"
      return player2
    else #player2 must have chosen paper
      return player1
    end
  end
end

def rps_tournament_winner(tournament)
  #first evaluate the base case where it is just one tournament
  if tournament.length() == 2 && tournament[0][0].class.to_s() == "String" && tournament[1][0].class.to_s() == "String"
    return rps_game_winner(tournament)
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end

#feel free to add your own helper functions as needed
