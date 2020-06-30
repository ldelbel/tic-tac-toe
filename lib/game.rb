require_relative '../lib/board'
class Game
  def initialize(players, order)
    @gam_order = order
    @players = players
    @board = Board.new(order)

    @available_moves = order**2
  end

  def play
    current_player = @players[0]
    another_player = @players[1]
    game_over = false

    while @available_moves.positive? || !game_over
      player_turn(current_player)
      @available_moves -= 1
      break if (game_over_with_winner = @board.winner?(current_player.mark))
      break if @available_moves < 1

      current_player, another_player = another_player, current_player
    end

    @board.print_board
    if game_over_with_winner
      display_result(current_player, current_player.increment_score)
    else
      display_result
    end
  end

  def player_turn(current_player)
    loop do
      @board.print_board
      puts "#{current_player.name}, pick a move"
      move = current_player.move.to_i
      place = @board.move_empty?(move)
      if move.negative? || move > @gam_order**2 || place.is_a?(Integer)
        puts 'Invalid move'
        next
      end
      @board.place_move(place, current_player.mark)
      break
    end
  end

  def display_result(current_player = nil, result = nil)
    puts 'Game over'
    if current_player.nil?
      puts "It's a draw"
    else
      puts "#{current_player.name} won!"
      puts "Score: #{result}"
    end
  end
end
