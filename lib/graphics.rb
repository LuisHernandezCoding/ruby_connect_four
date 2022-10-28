require_relative 'colors'

module Graphics
  def getting_title
    tittle = []
    tittle << '    ██████╗ ██████╗ ███╗   ██╗███████╗ ██████╗████████╗'
    tittle << '    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔════╝╚══██╔══╝'
    tittle << '    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║        ██║   '
    tittle << '    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║        ██║   '
    tittle << '    ╚██████╗╚██████╔╝██║ ╚████║███████╗╚██████╗   ██║   '
    tittle << '      ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═╝  '
    tittle << '      .---------------. '
    tittle << '      | .------------. |'
    tittle << '      | |  ██╗  ██╗  | |'
    tittle << '      | |  ██║  ██║  | |'
    tittle << '      | |  ███████║  | |'
    tittle << '      | |  ╚════██║  | |'
    tittle << '      | |       ██║  | |'
    tittle << '      | |       ╚═╝  | |'
    tittle << '      | \'------------\' |'
    tittle << '       \'--------------\''
    tittle
  end

  def getting_menu_block(title, options, max_size = 23)
    block = []
    block << "   ╔#{'═' * (max_size - 5)}╗ "
    block << "   ║#{title.center(max_size - 5)}║ "
    block << "   ╚╦#{'═' * (max_size - 7)}╦╝ "
    options.each_with_index do |option, index|
      block << "    ║#{index + 1}. #{option.center(max_size - 10)}║ "
      block << "    ╠#{'═' * (max_size - 7)}╣ " unless index == options.length - 1
      block << "    ╚#{'═' * (max_size - 7)}╝ " if index == options.length - 1
    end
    block
  end
end
