
def show_gameboard
  gameboard = [8, 1, 6, 3, 5, 7, 4, 9, 2]
  puts gameboard[0].to_s+" "+gameboard[1].to_s+" "+gameboard[2].to_s
  puts gameboard[3].to_s+" "+gameboard[4].to_s+" "+gameboard[5].to_s
  puts gameboard[6].to_s+" "+gameboard[7].to_s+" "+gameboard[8].to_s
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
