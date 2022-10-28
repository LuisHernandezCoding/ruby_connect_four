require_relative '../lib/logic'

describe Logic do
  subject(:logic) { Logic.new }

  describe '#valid_move' do
    describe 'when the column is valid' do
      let(:valid_move_board) { Array.new(6) { Array.new(7, 0) } }

      it 'should return true if the move is valid' do
        expect(logic.valid_move(valid_move_board, 3)).to eql(true)
      end
    end
    describe 'when the column is invalid' do
      let(:valid_move_board) { Array.new(6) { Array.new(7, 0) } }

      it 'should return false if the move is not valid' do
        expect(logic.valid_move(valid_move_board, 8)).to be(false)
      end
    end
    describe 'when the column is full' do
      let(:full_column_board) { Array.new(6) { Array.new(7, 1) } }

      it 'should return false if the move is not valid' do
        expect(logic.valid_move(full_column_board, -1)).to be(false)
      end
    end
  end

  describe '#full_board?' do
    describe 'when the board is full' do
      let(:full_board) { Board.new(Array.new(6) { Array.new(7, 1) }) }

      it 'should return true' do
        expect(logic.full_board?(full_board.return)).to be(true)
      end
    end
    describe 'when the board is not full' do
      let(:empty_board) { Board.new(Array.new(6) { Array.new(7, 0) }) }

      it 'should return false' do
        expect(logic.full_board?(empty_board.return)).to be(false)
      end
    end
  end

  describe '#valid_column?' do
    describe 'when the column is full' do
      let(:full_column_board) { Array.new(6) { Array.new(7, 1) } }

      it 'should return false' do
        expect(logic.valid_column?(full_column_board, 3)).to be(false)
      end
    end
  end

  describe '#win?' do
    describe 'when there is a horizontal win' do
      let(:horizontal_win_board) { Array.new(6) { Array.new(7, 0) } }

      describe 'on the first row' do
        it 'and the first 4 digits' do
          horizontal_win_board[0] = [1, 1, 1, 1, 0, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          horizontal_win_board[0] = [0, 1, 1, 1, 1, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          horizontal_win_board[0] = [0, 0, 0, 1, 1, 1, 1]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
      end

      describe 'on the second row' do
        it 'and the first 4 digits' do
          horizontal_win_board[1] = [1, 1, 1, 1, 0, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          horizontal_win_board[1] = [0, 1, 1, 1, 1, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          horizontal_win_board[1] = [0, 0, 0, 1, 1, 1, 1]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
      end

      describe 'on the third row' do
        it 'and the first 4 digits' do
          horizontal_win_board[2] = [1, 1, 1, 1, 0, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          horizontal_win_board[2] = [0, 1, 1, 1, 1, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          horizontal_win_board[2] = [0, 0, 0, 1, 1, 1, 1]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
      end

      describe 'on the fourth row' do
        it 'and the first 4 digits' do
          horizontal_win_board[3] = [1, 1, 1, 1, 0, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          horizontal_win_board[3] = [0, 1, 1, 1, 1, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          horizontal_win_board[3] = [0, 0, 0, 1, 1, 1, 1]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
      end

      describe 'on the fifth row' do
        it 'and the first 4 digits' do
          horizontal_win_board[4] = [1, 1, 1, 1, 0, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          horizontal_win_board[4] = [0, 1, 1, 1, 1, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          horizontal_win_board[4] = [0, 0, 0, 1, 1, 1, 1]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
      end

      describe 'on the sixth row' do
        it 'and the first 4 digits' do
          horizontal_win_board[5] = [1, 1, 1, 1, 0, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          horizontal_win_board[5] = [0, 1, 1, 1, 1, 0, 0]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          horizontal_win_board[5] = [0, 0, 0, 1, 1, 1, 1]
          expect(logic.win?(horizontal_win_board)).to be(true)
        end
      end
    end

    describe 'when there is a vertical win' do
      let(:vertical_win_board) { Array.new(6) { Array.new(7, 0) } }

      describe 'on the first column' do
        it 'and the first 4 digits' do
          vertical_win_board[0][0] = 1
          vertical_win_board[1][0] = 1
          vertical_win_board[2][0] = 1
          vertical_win_board[3][0] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          vertical_win_board[1][0] = 1
          vertical_win_board[2][0] = 1
          vertical_win_board[3][0] = 1
          vertical_win_board[4][0] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          vertical_win_board[2][0] = 1
          vertical_win_board[3][0] = 1
          vertical_win_board[4][0] = 1
          vertical_win_board[5][0] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
      end

      describe 'on the second column' do
        it 'and the first 4 digits' do
          vertical_win_board[0][1] = 1
          vertical_win_board[1][1] = 1
          vertical_win_board[2][1] = 1
          vertical_win_board[3][1] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          vertical_win_board[1][1] = 1
          vertical_win_board[2][1] = 1
          vertical_win_board[3][1] = 1
          vertical_win_board[4][1] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          vertical_win_board[2][1] = 1
          vertical_win_board[3][1] = 1
          vertical_win_board[4][1] = 1
          vertical_win_board[5][1] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
      end

      describe 'on the third column' do
        it 'and the first 4 digits' do
          vertical_win_board[0][2] = 1
          vertical_win_board[1][2] = 1
          vertical_win_board[2][2] = 1
          vertical_win_board[3][2] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          vertical_win_board[1][2] = 1
          vertical_win_board[2][2] = 1
          vertical_win_board[3][2] = 1
          vertical_win_board[4][2] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          vertical_win_board[2][2] = 1
          vertical_win_board[3][2] = 1
          vertical_win_board[4][2] = 1
          vertical_win_board[5][2] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
      end

      describe 'on the fourth column' do
        it 'and the first 4 digits' do
          vertical_win_board[0][3] = 1
          vertical_win_board[1][3] = 1
          vertical_win_board[2][3] = 1
          vertical_win_board[3][3] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          vertical_win_board[1][3] = 1
          vertical_win_board[2][3] = 1
          vertical_win_board[3][3] = 1
          vertical_win_board[4][3] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          vertical_win_board[2][3] = 1
          vertical_win_board[3][3] = 1
          vertical_win_board[4][3] = 1
          vertical_win_board[5][3] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
      end

      describe 'on the fifth column' do
        it 'and the first 4 digits' do
          vertical_win_board[0][4] = 1
          vertical_win_board[1][4] = 1
          vertical_win_board[2][4] = 1
          vertical_win_board[3][4] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          vertical_win_board[1][4] = 1
          vertical_win_board[2][4] = 1
          vertical_win_board[3][4] = 1
          vertical_win_board[4][4] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          vertical_win_board[2][4] = 1
          vertical_win_board[3][4] = 1
          vertical_win_board[4][4] = 1
          vertical_win_board[5][4] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
      end

      describe 'on the sixth column' do
        it 'and the first 4 digits' do
          vertical_win_board[0][5] = 1
          vertical_win_board[1][5] = 1
          vertical_win_board[2][5] = 1
          vertical_win_board[3][5] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          vertical_win_board[1][5] = 1
          vertical_win_board[2][5] = 1
          vertical_win_board[3][5] = 1
          vertical_win_board[4][5] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          vertical_win_board[2][5] = 1
          vertical_win_board[3][5] = 1
          vertical_win_board[4][5] = 1
          vertical_win_board[5][5] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
      end

      describe 'on the seventh column' do
        it 'and the first 4 digits' do
          vertical_win_board[0][6] = 1
          vertical_win_board[1][6] = 1
          vertical_win_board[2][6] = 1
          vertical_win_board[3][6] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          vertical_win_board[1][6] = 1
          vertical_win_board[2][6] = 1
          vertical_win_board[3][6] = 1
          vertical_win_board[4][6] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          vertical_win_board[2][6] = 1
          vertical_win_board[3][6] = 1
          vertical_win_board[4][6] = 1
          vertical_win_board[5][6] = 1
          expect(logic.win?(vertical_win_board)).to be(true)
        end
      end
    end

    describe 'when there is a diagonal win' do
      let(:diagonal_win_board) { Array.new(6) { Array.new(7) { 0 } } }

      describe 'on the first column' do
        it 'and the first 4 digits' do
          diagonal_win_board[0][0] = 1
          diagonal_win_board[1][1] = 1
          diagonal_win_board[2][2] = 1
          diagonal_win_board[3][3] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          diagonal_win_board[1][0] = 1
          diagonal_win_board[2][1] = 1
          diagonal_win_board[3][2] = 1
          diagonal_win_board[4][3] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          diagonal_win_board[2][0] = 1
          diagonal_win_board[3][1] = 1
          diagonal_win_board[4][2] = 1
          diagonal_win_board[5][3] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end

      describe 'on the second column' do
        it 'and the first 4 digits' do
          diagonal_win_board[0][1] = 1
          diagonal_win_board[1][2] = 1
          diagonal_win_board[2][3] = 1
          diagonal_win_board[3][4] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          diagonal_win_board[1][1] = 1
          diagonal_win_board[2][2] = 1
          diagonal_win_board[3][3] = 1
          diagonal_win_board[4][4] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          diagonal_win_board[2][1] = 1
          diagonal_win_board[3][2] = 1
          diagonal_win_board[4][3] = 1
          diagonal_win_board[5][4] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end

      describe 'on the third column' do
        it 'and the first 4 digits' do
          diagonal_win_board[0][2] = 1
          diagonal_win_board[1][3] = 1
          diagonal_win_board[2][4] = 1
          diagonal_win_board[3][5] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          diagonal_win_board[1][2] = 1
          diagonal_win_board[2][3] = 1
          diagonal_win_board[3][4] = 1
          diagonal_win_board[4][5] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          diagonal_win_board[2][2] = 1
          diagonal_win_board[3][3] = 1
          diagonal_win_board[4][4] = 1
          diagonal_win_board[5][5] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end

      describe 'on the fourth column' do
        it 'and the first 4 digits' do
          diagonal_win_board[0][3] = 1
          diagonal_win_board[1][4] = 1
          diagonal_win_board[2][5] = 1
          diagonal_win_board[3][6] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the middle 4 digits' do
          diagonal_win_board[1][3] = 1
          diagonal_win_board[2][4] = 1
          diagonal_win_board[3][5] = 1
          diagonal_win_board[4][6] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and the last 4 digits' do
          diagonal_win_board[2][3] = 1
          diagonal_win_board[3][4] = 1
          diagonal_win_board[4][5] = 1
          diagonal_win_board[5][6] = 1
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end

      describe 'on the seventh column but inverted' do
        it 'and ends at the first 4 digits' do
          diagonal_win_board[3] = [1, 0, 0, 0, 0, 0, 0]
          diagonal_win_board[2] = [0, 1, 0, 0, 0, 0, 0]
          diagonal_win_board[1] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[0] = [0, 0, 0, 1, 0, 0, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the middle 4 digits' do
          diagonal_win_board[4] = [1, 0, 0, 0, 0, 0, 0]
          diagonal_win_board[3] = [0, 1, 0, 0, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[1] = [0, 0, 0, 1, 0, 0, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the last 4 digits' do
          diagonal_win_board[5] = [1, 0, 0, 0, 0, 0, 0]
          diagonal_win_board[4] = [0, 1, 0, 0, 0, 0, 0]
          diagonal_win_board[3] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 1, 0, 0, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end

      describe 'on the sixth column but inverted' do
        it 'and ends at the first 4 digits' do
          diagonal_win_board[3] = [0, 1, 0, 0, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[1] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[0] = [0, 0, 0, 0, 1, 0, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the middle 4 digits' do
          diagonal_win_board[4] = [0, 1, 0, 0, 0, 0, 0]
          diagonal_win_board[3] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[1] = [0, 0, 0, 0, 1, 0, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the last 4 digits' do
          diagonal_win_board[5] = [0, 1, 0, 0, 0, 0, 0]
          diagonal_win_board[4] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[3] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 0, 1, 0, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end

      describe 'on the fifth column but inverted' do
        it 'and ends at the first 4 digits' do
          diagonal_win_board[3] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[1] = [0, 0, 0, 0, 1, 0, 0]
          diagonal_win_board[0] = [0, 0, 0, 0, 0, 1, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the middle 4 digits' do
          diagonal_win_board[4] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[3] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 0, 1, 0, 0]
          diagonal_win_board[1] = [0, 0, 0, 0, 0, 1, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the last 4 digits' do
          diagonal_win_board[5] = [0, 0, 1, 0, 0, 0, 0]
          diagonal_win_board[4] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[3] = [0, 0, 0, 0, 1, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 0, 0, 1, 0]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end

      describe 'on the fourth column but inverted' do
        it 'and ends at the first 4 digits' do
          diagonal_win_board[3] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 0, 1, 0, 0]
          diagonal_win_board[1] = [0, 0, 0, 0, 0, 1, 0]
          diagonal_win_board[0] = [0, 0, 0, 0, 0, 0, 1]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the middle 4 digits' do
          diagonal_win_board[4] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[3] = [0, 0, 0, 0, 1, 0, 0]
          diagonal_win_board[2] = [0, 0, 0, 0, 0, 1, 0]
          diagonal_win_board[1] = [0, 0, 0, 0, 0, 0, 1]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
        it 'and ends at the last 4 digits' do
          diagonal_win_board[5] = [0, 0, 0, 1, 0, 0, 0]
          diagonal_win_board[4] = [0, 0, 0, 0, 1, 0, 0]
          diagonal_win_board[3] = [0, 0, 0, 0, 0, 1, 0]
          diagonal_win_board[2] = [0, 0, 0, 0, 0, 0, 1]
          expect(logic.win?(diagonal_win_board)).to be(true)
        end
      end
    end
  end
end
