require_relative 'game'
require_relative 'console_printer'
require_relative 'graphics'
require 'yaml'

class Menu
  include ConsolePrinter
  include Graphics

  def print_menu(title, options)
    screen = compound_menu(title, options)
    print_message(screen, 100, 'bg_dark gray', 'bg_blue', use_frame: true)
    print_input_field(100, 'bg_black', '>')
  end

  def ask_for_input(options = %w[1 2 3 4], messages = [])
    loop do
      chose = gets.chomp.downcase
      return chose if chose.match(/[#{options.join}]/)

      print_menu('Invalid input!', messages)
    end
  end

  def main_menu
    options = ['New Game', 'Load Game', 'Exit']
    print_menu('Main Menu', options)
    chose = ask_for_input(%w[1 2 3], options)
    case chose
    when '1'
      game = Game.new
      game.play
    when '2'
      game = File.exist?('./assets/saved_game.yml') ? YAML.unsafe_load(File.read('./assets/saved_game.yml')) : Game.new
      game.play
    when '3' then exit
    end
  end
end
