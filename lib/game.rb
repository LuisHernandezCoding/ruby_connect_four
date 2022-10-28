require_relative '../lib/board'
require_relative '../lib/logic'

class Game
  attr_reader :turn

  def initialize
    @board = Board.new
    @logic = Logic.new
    @turn = 1
  end

  def next_turn
    @turn += 1
    @turn = 1 if @turn > 2
    @turn
  end

  def play
    print_board
    loop do
      puts "Player #{@turn} turn"
      puts 'Enter a column number between 1 and 7'
      column = getting_user_input
      @board.update(column, @turn)
      print_board
      if @logic.win?(@board.return)
        puts "Player #{@turn} won!"
        break
      end
      next_turn
    end
  end

  def getting_user_input
    loop do
      column = gets.chomp.to_i
      return column - 1 if column.between?(1, 7) && @logic.valid_column?(@board.return, column - 1)

      puts 'Invalid input, try again'
    end
  end

  def print_board
    system 'clear' or system 'cls'
    @board.return.reverse.each do |row|
      puts row.join(' ')
    end
  end
end
