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
    if player_positions.length >= 3
      triples = player_positions.combination(3).to_a
      triples.each do |triple|
        sum = triple.inject(:+)
        if sum === 15
          puts "you won"
          return true
        end
      end
      return false
    end
  end

  def whos_turn_is_it(num) 
    if num.odd?
      puts "player x turn"
      player = playerX 
    else 
      puts "player o turn" 
      player = playerO
    end
    return player 
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
  display = game.show_gameboard(game.gameboard)
  puts display
  player_move = player.get_play(game.gameboard)
   
   player.moves.push(player_move) 
   if game.check_for_win(player.moves)
     break
   end
  game.gameboard[game.gameboard.index(player_move)] = player.name 
end
