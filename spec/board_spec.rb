require './lib/board'

describe Board do
  let(:board) { Board.new(3) }
  describe '#row_check?' do
    it 'returns true if one sign marks the entire row' do
      board.instance_variable_set(:@current_board, [%w[X X X], [4, 5, 6], [7, 8, 9]])
      expect(board.row_check?('X')).to be(true)
    end
  end

  describe '#column_check?' do
    it 'returns true if one sign marks the entire column' do
      board.instance_variable_set(:@current_board, [['X', 2, 3], ['X', 5, 6], ['X', 8, 9]])
      expect(board.column_check?('X')).to be(true)
    end
  end

  describe '#diagonal_check?' do
    it 'returns true if one sign marks the entire diagonal' do
      board.instance_variable_set(:@current_board, [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']])
      expect(board.diagonal_check?('X')).to be(true)
    end
  end

  describe '#winner?' do
    context 'when #row_check? or #column_check? or #diagonal_check? is true' do
      it 'returns true' do
        board.instance_variable_set(:@current_board, [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']])
        expect(board.winner?('X')).to be(true)
      end
    end

    context 'when #row_check?, #column_check?, and #diagonal_check? are false' do
      it 'returns false' do
        board.instance_variable_set(:@current_board, [[1, 'X', 3], [4, 'X', 6], [7, 8, 'X']])
        expect(board.winner?('X')).to be(false)
      end
    end
  end

  describe '#place_move' do
    context 'when player makes a valid move' do
      it 'returns updated current_board' do
        place = [0, 1]
        expect(board.place_move(place, 'X')).to eql([[1, 'X', 3], [4, 5, 6], [7, 8, 9]])
      end
    end

    context 'when player makes an invalid move' do
      it 'raises NoMethodError' do
        place = 3
        expect { board.place_move(place, 'X') }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#move_empty?' do
    context 'When player move is valid' do
      it 'returns an array' do
        expect(board.move_empty?(2)).to eql([0, 1])
      end
    end
    context 'when player move is not valid' do
      it 'returns the move' do
        expect(board.move_empty?(10)).to eql(10)
      end
    end
  end
end
