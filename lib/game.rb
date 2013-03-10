

def show_gameboard(gameboard)
  "#{gameboard[0]} #{gameboard[1]} #{gameboard[2]}\n" + 
  "#{gameboard[3]} #{gameboard[4]} #{gameboard[5]}\n" +
  "#{gameboard[6]} #{gameboard[7]} #{gameboard[8]}"
end 


gameboard = [8, 1, 6, 3, 5, 7, 4, 9, 2]
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
  puts "Choose a number"
  board_number = gets.to_i
  gameboard[gameboard.index(board_number)] = marker
end
