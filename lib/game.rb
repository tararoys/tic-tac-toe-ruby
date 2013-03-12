class Game 
  attr_reader :gameboard, :playerX, :playerO 

  def initialize
    @gameboard = [8, 1, 6, 3, 5, 7, 4, 9, 2]
    @playerX = Player.new("x") 
    @playerO = Player.new("O") 
  end

  def show_gameboard(gameboard)
    "#{gameboard[0]} #{gameboard[1]} #{gameboard[2]}\n" + 
    "#{gameboard[3]} #{gameboard[4]} #{gameboard[5]}\n" +
    "#{gameboard[6]} #{gameboard[7]} #{gameboard[8]}"
  end 

  def check_for_win(player_positions)
    get_combos(player_positions).each do |combo|
      return true if combo.inject(:+) == 15 
    end
    false
  end
  
  def get_combos(player_positions)
    player_positions.combination(3).to_a
  end

  def whos_turn_is_it(num) 
    num.odd? ? playerX : playerO
  end
end

class Player
  attr_accessor :name, :moves
  def initialize(name)
    @name = name
    @moves = [] 
  end
  def get_play(gameboard)
    puts "choose a number on the gameboard"
    board_number = gets.to_i
    until  gameboard.include?(board_number)
      puts "choose a number on the board"
      board_number = gets.to_i
    end
    return board_number
  end
end

game = Game.new 

9.times do |num|   
  player = game.whos_turn_is_it(num)
  puts "It is player #{player.name}'s turn"
  display = game.show_gameboard(game.gameboard)
  puts display
  player_move = player.get_play(game.gameboard)
   
  player.moves.push(player_move) 
  if game.check_for_win(player.moves)
    puts "you won"
    break
  end
  game.gameboard[game.gameboard.index(player_move)] = player.name 
end
