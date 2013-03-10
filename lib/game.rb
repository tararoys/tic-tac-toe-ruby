
def show_gameboard
  gameboard = [8, 1, 6, 3, 5, 7, 4, 9, 2]
  "#{gameboard[0]} #{gameboard[1]} #{gameboard[2]}\n" + 
  "#{gameboard[3]} #{gameboard[4]} #{gameboard[5]}\n" +
  "#{gameboard[6]} #{gameboard[7]} #{gameboard[8]}"
end 

9.times do |num| 
  if num.odd?
    puts "Player X Turn"
  else 
    puts "Player O turn" 
  end
  show_gameboard
  puts "Choose a number"
end
