require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }

  describe '#return' do
    it 'should return the board' do
      array = Array.new(6) { Array.new(7, 0) }
      expect(board.return).to eql(array)
    end
  end

  describe '#clean' do
    it 'should return the board but cleaned (empty)' do
      clean_board = [
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0]
      ]
      expect(board.clean).to eql(clean_board)
    end
  end

  describe '#update' do
    subject(:updating_board) { Board.new }

    it 'should return the updated board' do
      old_board = updating_board.return
      updating_board.update(1, 1)
      expected_board = old_board
      expected_board[0][1] = 1
      expect(updating_board.return).to eql(expected_board)
    end
  end
end
