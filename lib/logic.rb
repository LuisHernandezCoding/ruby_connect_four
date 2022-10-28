class Logic
  def valid_move(board, column)
    valid = column < 7 && column >= 0
    valid = valid_column?(board, column) if valid
    valid
  end

  def full_board?(board)
    board.each do |row|
      return false if row.include?(0)
    end
    true
  end

  def valid_column?(board, column)
    board.each do |row|
      return true if row[column].zero?
    end
    false
  end

  def win?(board)
    horizontal_win?(board) || vertical_win?(board) || diagonal_win?(board)
  end

  private

  def horizontal_win?(board)
    board.each do |row|
      row.each_cons(4) do |a, b, c, d|
        return true if a == b && b == c && c == d && a != 0
      end
    end
    false
  end

  def vertical_win?(board)
    board.transpose.each do |row|
      row.each_cons(4) do |a, b, c, d|
        return true if a == b && b == c && c == d && a != 0
      end
    end
    false
  end

  def diagonal_win?(board)
    board.each_with_index do |row, i|
      row.each_with_index do |_, j|
        return true if diagonal_win_helper(board, i, j)
      end
    end
    false
  end

  def diagonal_win_helper(board, index_i, index_j)
    return false if index_i > 2 || index_j > 3

    diagonal_win_helper_left(board, index_i, index_j) || diagonal_win_helper_right(board, index_i, index_j)
  end

  def diagonal_win_helper_left(board, index_i, index_j)
    a = board[index_i][index_j]
    b = board[index_i + 1][index_j + 1]
    c = board[index_i + 2][index_j + 2]
    d = board[index_i + 3][index_j + 3]

    return true if a == b && b == c && c == d && a != 0

    false
  end

  def diagonal_win_helper_right(board, index_i, index_j)
    a = board[index_i][index_j + 3]
    b = board[index_i + 1][index_j + 2]
    c = board[index_i + 2][index_j + 1]
    d = board[index_i + 3][index_j]

    return true if a == b && b == c && c == d && a != 0

    false
  end
end
