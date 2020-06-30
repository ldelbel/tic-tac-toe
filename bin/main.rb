#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/game'

puts 'Welcome to Tic Tac Toe'

def get_input(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def get_name(prompt)
  name = ''
  loop do
    name = get_input(prompt)
    if name.length <= 0 || name.to_i.positive? || name == '0'
      puts 'Invalid name, try again'
      next
    end
    return name
  end
end

# Taking player names from the  console
@current_player_name = get_name('Player 1, enter your name')

# taking players mark
loop do
  @mark = get_input('Select a mark: X or O').upcase
  unless %w[X O].include?(@mark.upcase)
    puts 'Invalid mark, try again'
    next
  end
  @another_player_mark = @mark.upcase == 'X' ? 'O' : 'X'
  break
end

current_player = Player.new(@current_player_name, @mark)
loop do
  @another_player_name = get_name('Player 2, enter your name')
  if @another_player_name.upcase == @current_player_name.upcase
    puts 'Invalid name. Name should not be the same'
    next
  end
  break
end
another_player = Player.new(@another_player_name, @another_player_mark)

# starting the game
# grabing the order of the game from the current player
loop do
  prompt = "#{@current_player_name}, enter game order"
  prompt += "\nAvailable order are 3 to 5 inclusive"
  @order = get_input(prompt).chomp.to_i

  if @order.negative? || @order > 5
    puts 'Invalide input'
    next
  end
  break
end
# game's board inteaction starts here
loop do
  game = Game.new([current_player, another_player], @order)
  puts 'Game starting ....'
  game.play
  puts 'Want to play another round?'
  puts "Type 'yes' to continue"
  print '> '
  ans = gets.chomp.strip
  case ans.upcase
  when 'YES' then next
  else break
  end
end
