class Board
  attr_accessor :current_board
  def initialize(factor)
    @factor = factor
    @current_board = Array.new(@factor) { Array.new(@factor) }
    initialize_board
  end

  def initialize_board
    i = 0
    k = 1
    while i < @current_board.size
      j = 0
      while j < @current_board.size
        @current_board[i][j] = k
        k += 1
        j += 1
      end
      # puts
      i += 1
    end
  end

  def print_board
    i = 0
    k = 1
    while i < @current_board.size
      j = 0
      while j < @current_board.size
        if k <= 9
          print(" #{@current_board[i][j]} | ")
        else
          print("#{@current_board[i][j]} | ")
        end
        k += 1
        j += 1
      end
      print "\n"
      i += 1
    end
  end

  def row_check?(marker)
    @current_board.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_check?(marker)
    (0...@factor).any? do |column|
      @current_board.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_check?(mark)
    i = 0
    diagonal1 = []
    diagonal2 = []
    while i < @current_board.size
      diagonal1 << @current_board[i][i]
      diagonal2 << @current_board[i][@current_board.size - 1 - i]
      i += 1
    end
    return true if diagonal1.all?(mark) || diagonal2.all?(mark)

    false
  end

  def winner?(mark)
    row_check?(mark) || column_check?(mark) || diagonal_check?(mark)
  end

  def place_move(place, mark)
    @current_board[place.first][place.last] = mark
    @current_board
  end

  def move_empty?(move)
    i = 0
    j = 0
    arr = []
    while i < @current_board.size
      j = 0
      while j < @current_board.size
        if @current_board[i][j] == move
          arr << i << j
          return arr
        end
        j += 1
      end
      i += 1
    end
    move
  end
end
