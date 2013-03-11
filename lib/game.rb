

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
        puts "You Won"
        return true
      end
    end
  end
end

gameboard = [8, 1, 6, 3, 5, 7, 4, 9, 2]
playerX = []
playerO = []
  
9.times do |num|   
  if num.odd?
    puts "Player X Turn"
    marker = "x"
  else 
    puts "Player O turn" 
    marker = "O"
  end
  display = show_gameboard(gameboard)
  puts display
  puts "Choose a number on the gameboard"
  board_number = gets.to_i
  until  gameboard.include?(board_number)
    puts "Choose a number on the board"
    board_number = gets.to_i
  end
  if marker === "x"
   playerX.push(board_number) 
   puts "Player x has the following: #{playerX}"
   if check_for_win(playerX)
     break
   end
  elsif marker === "O"
   playerO.push(board_number) 
   puts "Player O has the following: #{playerO}"
   if check_for_win(playerO)
     break
   end
  end
  gameboard[gameboard.index(board_number)] = marker
end
