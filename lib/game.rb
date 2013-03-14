class Game 
  attr_reader :gameboard, :playerX, :playerO 

  def initialize
    @gameboard = [8, 1, 6, 3, 5, 7, 4, 9, 2]
    @playerX = ComputerPlayer.new("x") 
    @playerO = Player.new("O") 
  end
  
  def valid_moves
    gameboard.select{ |space| space.is_a? Integer }
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
  
  def count(letter)
    letter_count = 0
    gameboard.each do |symbol|
      if symbol == letter 
        letter_count += 1
      end
    end 
    letter_count
  end 

  def whos_turn_is_it
    count('x') == count('O') ? playerX : playerO
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

  def turn(game)
    puts "choose a number on the gameboard"
    move = gets.to_i
    until game.valid_moves.include?(move)
      puts "choose a number on the board"
      move = gets.to_i
    end
    moves << move
    move
  end
end

class ComputerPlayer
  attr_accessor :name, :moves
  
  def initialize(name)
    @name = name
    @moves = [] 
  end

  def get_combos
    moves.combination(3).to_a
  end
  
 def winning_move(game)
   pairs = moves.combination(2).to_a 
   pairs.each do |pair| 
     sum = pair.inject(:+)
     possible_move = 15 - sum 
     if game.valid_moves.include?(possible_move)
       return possible_move 
     end 
   end
 end 

  def turn(game)
    win = winning_move(game) 
    if win 
      move = win
    else
      move = game.valid_moves.sample
    end
    moves << move 
    move 
  end
end

