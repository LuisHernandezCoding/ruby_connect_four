class Board
  def initialize(board = Array.new(6) { Array.new(7, 0) })
    @board = board
  end

  def return
    @board
  end

  def clean
    @board = Array.new(6) { Array.new(7, 0) }
  end

  def update(column, player)
    @board.each do |row|
      next unless row[column].zero?

      row[column] = player
      break
    end
  end
end
