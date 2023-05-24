require_relative "cursor"
require_relative "board"
require "colorize"

class Display
    attr_accessor :board
    def initialize(cursor_pos,board)
        @cursor_pos = cursor_pos
        @board = board
        @cursor = Cursor.new(cursor_pos, board)
    end
    def render
        board.rows.each_with_index do |row,i|
            row.each_with_index do |square,j|
                shade = ((i+j) % 2).even? ? :white : :black
                if @cursor_pos == [i,j]
                    print "\e[44m#{" " + square.symbol + " "}\e[0m"
                elsif shade == :black
                    print "\e[45m#{" " + square.symbol + " "}\e[0m"
                else
                    print "\e[47m#{" " + square.symbol + " "}\e[0m"
                end
            end
            print "\n"
        end
    end
    def run
        counter = 0
        start_pos = nil
        end_pos = nil
        while true
        render
        prev_pos = @cursor_pos
        @cursor_pos = @cursor.get_input
        # rescue RuntimeError => e
        #     puts e.message
        # end
        if @cursor_pos == prev_pos
            counter += 1
            if counter == 1
                start_pos = @cursor_pos
            else
                end_pos = @cursor_pos
                board.move_piece(start_pos,end_pos)
                counter = 0
            end
        end
        system("clear")
        end
    end
end

display = Display.new([1,1],Board.new)
display.run