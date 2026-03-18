require_relative 'colors'

module Graphics
  def getting_title
    tittle = []
    tittle << '                                                                          '
    tittle << '            ██████╗ ██████╗ ███╗   ██╗███████╗ ██████╗████████╗           '
    tittle << '           ██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔════╝╚══██╔══╝           '
    tittle << '           ██║     ██║   ██║██╔██╗ ██║█████╗  ██║        ██║              '
    tittle << '           ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║        ██║              '
    tittle << '           ╚██████╗╚██████╔╝██║ ╚████║███████╗╚██████╗   ██║              '
    tittle << '            ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═╝              '
    tittle << '           ▛▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▜      By: @LuisHernandezCoding               '
    tittle << '           ▌ ▛▀▀▀▀▀▀▀▀▀▀▀▀▜ ▐    '
    tittle << '           ▌ ▌  ██╗  ██╗  ▐ ▐    '
    tittle << '           ▌ ▌  ██║  ██║  ▐ ▐    '
    tittle << '           ▌ ▌  ███████║  ▐ ▐    '
    tittle << '           ▌ ▌  ╚════██║  ▐ ▐    '
    tittle << '           ▌ ▌       ██║  ▐ ▐    '
    tittle << '           ▌ ▌       ╚═╝  ▐ ▐    '
    tittle << '           ▌ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▐    '
    tittle << '           ▙▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▟    '
    tittle << '                                 '
    tittle
  end

  def beautify_board(board)
    output = []
    board.each do |row|
      output << row.map do |cell|
        case cell
        when 0 then ' ◯ '.bg_green.bold
        when 1 then ' ◉ '.bg_green.blue
        when 2 then ' ◉ '.bg_green.red
        end
      end
    end
    output.reverse
  end

  def compound_screen(board)
    beautifull_board = beautify_board(board)
    output = getting_title
    output[8] += '╔═╦═════════════════════════╦═╗'.bg_black + '          '.bg_blue
    output[9] += '║╳║╭══1══2══3══4══5══6══7══╮║╳║'.bg_black + '          '.bg_blue
    beautifull_board.each_with_index do |row, index|
      text = '║╳║│'.bg_black + " #{row.join}".bg_green + ' '.bg_green + '│║╳║'.bg_black.white + '          '.bg_blue
      output[10 + index] += text
    end
    output[10 + beautifull_board.length] += '║╳║╰═══════════════════════╯║╳║'.bg_black + '          '.bg_blue
    output[11 + beautifull_board.length] += '╚═╩═════════════════════════╩═╝'.bg_black + '          '.bg_blue
    output
  end

  def compound_menu(title, options)
    menu = getting_menu_block(title, options, 34)
    output = getting_title
    menu.each_with_index do |row, index|
      output[8 + index] += row if index < output.length - 8
    end
    output
  end

  def getting_menu_block(title, options, max_size = 23)
    block = []
    block << "╔#{'═' * (max_size - 8)}╗             "
    block << "║#{title.center(max_size - 8)}║             "
    block << "╚╦#{'═' * (max_size - 10)}╦╝             "
    options.each_with_index do |option, index|
      block << " ║#{index + 1}. #{option.center(max_size - 13)}║              "
      block << " ╠#{'═' * (max_size - 10)}╣              " unless index == options.length - 1
      block << " ╚#{'═' * (max_size - 10)}╝              " if index == options.length - 1
    end
    block
  end
end
