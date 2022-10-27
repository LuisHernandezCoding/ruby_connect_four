require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }

  describe '#return' do
    it 'should return the board' do
      array = Array.new(6) { Array.new(7, 0) }
      expect(board.return).to eql(array)
    end
  end

  describe '#empty_board' do
    it 'should return an empty board' do
      empty_board = [
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0]
      ]
      expect(board.empty_board).to eql(empty_board)
    end
  end

  describe '#valid_move' do
    it 'should return true if the move is valid' do
      expect(board.valid_move(3)).to eql(true)
    end
    it 'should return false if the move is not valid' do
      expect(board.valid_move(8)).to be(false)
    end

    before do
      board.instance_variable_set(:@board, [
                                    [1, 0, 0, 0, 0, 0, 0],
                                    [1, 0, 0, 0, 0, 0, 0],
                                    [1, 0, 0, 0, 0, 0, 0],
                                    [1, 0, 0, 0, 0, 0, 0],
                                    [1, 0, 0, 0, 0, 0, 0],
                                    [1, 0, 0, 0, 0, 0, 0]
                                  ])
    end

    it 'should return false if the column is full' do
      expect(board.valid_move(0)).to be(false)
    end
    it 'should return true if the column is not full' do
      expect(board.valid_move(1)).to be(true)
    end
  end

  describe '#update_board' do
    subject(:updating_board) { Board.new }

    it 'should return the updated board' do
      old_board = updating_board.return
      updating_board.update_board(1, 1)
      expected_board = old_board
      expected_board[0][1] = 1
      expect(updating_board.return).to eql(expected_board)
    end
  end

  describe '#full_board?' do
    subject(:full_board) { Board.new(Array.new(6) { Array.new(7, 1) }) }
    it 'should return true if the board its full' do
      expect(full_board.full_board?).to eql(true)
    end
  end
end
