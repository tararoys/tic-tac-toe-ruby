
9.times do |num| 
  if num.odd?
    puts "Player X Turn"
  else 
    puts "Player O turn" 
  end
  puts "8 1 6"
  puts "3 5 7"
  puts "4 9 2"
  puts "Choose a number"
  number = gets 
end
