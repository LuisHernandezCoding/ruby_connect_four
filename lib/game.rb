require_relative '../lib/board'
require_relative '../lib/logic'
require_relative '../lib/display'

class Game
  attr_reader :turn

  def initialize
    @board = Board.new
    @logic = Logic.new
    @display = Display.new
    @turn = 1
  end

  def next_turn
    @turn += 1
    @turn = 1 if @turn > 2
    @turn
  end

  def play
    loop do
      messages = ['', "Player #{@turn}'s turn, choose a column: ", 'Enter a number between 1 and 7']
      @display.print_board(@board.return, messages)
      column = getting_user_input
      @board.update(column, @turn)
      @display.print_board(@board.return)
      if @logic.win?(@board.return)
        @display.print_board(@board.return, ["Player #{@turn} wins!"])
        File.delete('./assets/saved_game.yml')
        break
      end
      if @logic.full_board?(@board.return)
        @display.print_board(@board.return, ['Draw!'])
        File.delete('./assets/saved_game.yml')
        break
      end
      File.write('./assets/saved_game.yml', YAML.dump(self))
      next_turn
    end
  end

  def getting_user_input
    loop do
      column = gets.chomp.to_i
      return column - 1 if column.between?(1, 7) && @logic.valid_column?(@board.return, column - 1)

      messages = ["Player #{@turn}'s Invalid input, try again", 'Enter a number between 1 and 7']
      @display.print_board(@board.return, messages)
    end
  end
end
