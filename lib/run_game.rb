require "./game"

game = Game.new 

until game.valid_moves == [] do   
  player = game.whos_turn_is_it
  puts "It is player #{player.name}'s turn"
  puts game.display
  player_move = player.turn(game)
   
  if game.check_for_win(player)
    puts "you won"
    break
  end
  game.mark_board(player_move, player)

end
