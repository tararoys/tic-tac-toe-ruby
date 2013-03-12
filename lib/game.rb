class Game 
  attr_reader :gameboard, :playerX, :playerO 

  def initialize
    @gameboard = [8, 1, 6, 3, 5, 7, 4, 9, 2]
    @playerX = Computer_player.new("x") 
    @playerO = Player.new("O") 
  end

  def display 
    "#{gameboard[0]} #{gameboard[1]} #{gameboard[2]}\n" + 
    "#{gameboard[3]} #{gameboard[4]} #{gameboard[5]}\n" +
    "#{gameboard[6]} #{gameboard[7]} #{gameboard[8]}"
  end 

  def mark_board(player_move, player)
    gameboard[gameboard.index(player_move)] = player.name 
  end

  def check_for_win(player)
    player.get_combos.each do |combo|
      return true if combo.inject(:+) == 15 
    end
    false
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

  def get_combos
    moves.combination(3).to_a
  end

  def turn(gameboard)
    puts "choose a number on the gameboard"
    board_number = gets.to_i
    until gameboard.include?(board_number)
      puts "choose a number on the board"
      board_number = gets.to_i
    end
    moves << board_number
    board_number
  end
end

class Computer_player
  attr_accessor :name, :moves
  
  def initialize(name)
    @name = name
    @moves = [] 
  end

  def get_combos
    moves.combination(3).to_a
  end

  def turn(gameboard)
    board_number=rand(9)
    until gameboard.include?(board_number)
      board_number = rand(9) 
    end
    moves << board_number
    board_number
  end
end

game = Game.new 

9.times do |num|   
  player = game.whos_turn_is_it(num)
  puts "It is player #{player.name}'s turn"
  puts game.display
  player_move = player.turn(game.gameboard)
   
  if game.check_for_win(player)
    puts "you won"
    break
  end
  game.mark_board(player_move, player)

end
