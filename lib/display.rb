require_relative 'console_printer'
require_relative 'graphics'

class Display
  include ConsolePrinter
  include Graphics

  def print_board(board, messages = [], size = 100)
    screen = compound_screen(board)
    screen += messages.map { |line| line.center(size - 26) } unless messages.empty?
    system 'clear' or system 'cls'
    print_message(screen, size, 'bg_dark gray', 'bg_blue', use_frame: true)
    print_input_field(size, 'bg_black', '>')
  end
end
