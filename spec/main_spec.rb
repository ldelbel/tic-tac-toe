require './bin/main'

  describe Board do
    describe '#row_check?' do
      it 'returns true if one sign marks the entire row' do
        board = Board.new(3)
        board.instance_variable_set(:@current_board, [['X', 'X', 'X'], [4, 5, 6], [7, 8, 9]])
        expect(board.row_check?('X')).to be(true)
      end
    end

    describe '#column_check?' do
      it 'returns true if one sign marks the entire column' do
        board = Board.new(3)
        board.instance_variable_set(:@current_board, [['X', 2, 3], ['X', 5, 6], ['X', 8, 9]])
        expect(board.column_check?('X')).to be(true)
      end
    end

    describe '#diagonal_check?' do
      it 'returns true if one sign marks the entire diagonal' do
        board = Board.new(3)
        board.instance_variable_set(:@current_board, [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']])
        expect(board.diagonal_check?('X')).to be(true)
      end
    end

    describe '#winner?' do
      context 'when #row_check? or #column_check? or #diagonal_check? is true' do
        it 'returns true' do
          board = Board.new(3)
          board.instance_variable_set(:@current_board, [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']])
          expect(board.winner?('X')).to be(true)
        end
      end

      context 'when #row_check?, #column_check?, and #diagonal_check? are false' do
        it 'returns false' do
          board = Board.new(3)
          board.instance_variable_set(:@current_board, [[1, 'X', 3], [4, 'X', 6], [7, 8, 'X']])
          expect(board.winner?('X')).to be(false)
        end
      end
    end

    describe '#place_move' do
      context 'when player makes a valid move' do
        it 'returns updated current_board' do
          board = Board.new(3)
          place = [0,1]
          expect(board.place_move(place,'X')).to eql([[1, 'X', 3], [4, 5, 6], [7, 8, 9]])
        end
      end

      context 'when player makes an invalid move' do
        it 'raises NoMethodError' do
          board = Board.new(3)
          place = 3
          expect{board.place_move(place,'X')}.to raise_error(NoMethodError)
        end
      end
    end
  end

