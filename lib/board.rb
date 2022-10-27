class Board
  attr_reader :board

  def initialize(board = Array.new(6) { Array.new(7, 0) })
    @board = board
  end

  def return
    @board
  end

  def empty_board
    @board = Array.new(6) { Array.new(7, 0) }
  end

  def valid_move(column)
    check = column < 7 && column >= 0
    check = check_column(column) if check
    check
  end

  def update_board(column, player)
    @board.each do |row|
      next unless row[column].zero?

      row[column] = player
      break
    end
  end

  def full_board?
    @board.each do |row|
      return false if row.include?(0)
    end
    true
  end

  private

  def check_column(column)
    @board.each do |row|
      return true if row[column].zero?
    end
    false
  end
end
