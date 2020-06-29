#!/usr/bin/env ruby

def board_size(factor)
  order = factor ** 2
  ar = (1..order).map {|i| i}
  i = 1
  k = 0
  while i <= factor
    j = 1
    str = ""
    while j <= factor
      if k < 9
        j == factor ? print(" #{ar[k]}") : print(" #{ar[k]} | ")
      else
        j == factor ? print("#{ar[k]}") : print("#{ar[k]} | ")
      end
      k += 1
      j += 1
    end
    puts
    i += 1
  end

end

puts 'Welcome to Tic Tac Toe'

#Taking player names from the  console
player1_name = ""
puts "Player 1, enter your name: "
print ">"
player1_name = gets.chomp.strip

player_name = ""
puts "Player 2, enter your name: "
print ">"
player2_name = gets.chomp.strip

#Taking playes mark from the  console
player1_mark = ""
player2_mark = ""
loop do
  puts "#{player1_name}, select a mark: "
  puts "X, or O"
  print ">"
  input = gets.chomp.strip
    if input.upcase == "X"
      player1_mark = "X"
      player2_mark = "O"
      break
    elsif input.upcase == "O"
      player1_mark = "O"
      player2_mark = "X"
      break
    else
      next
    end
      
end
puts "Game started ..."
puts "#{player1_name}'s mark will be: #{player1_mark}"
puts "#{player2_name}'s  mark will be: #{player2_mark}"

#Taking the order of the game from the  console

order = 3

loop do
  puts "Enter the order of the game:"
  puts "Availabe order are from 3 to 10 inclusive"
  print ">"
  order = gets.chomp.strip.to_i

  next if order < 3 or order > 10
  break;
end

board_size(order)
puts "#{player1_name}, select a move:"
print ">"
player1_move = gets.chomp.strip
board_size(order)

# Checks if it is a valid number, gives an error if not, loop again
# Substitute the number in the selected position for the corresponding mark
# Prints the updated board
# Ask for the move of player 2
# Repeat the process
# Do it until someone wins or the board is full
# Print the result




