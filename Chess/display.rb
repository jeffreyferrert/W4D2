require_relative "cursor"
require_relative "board"
require "colorize"

class Display
    attr_reader :board
    def initialize(cursor_pos,board)
        @cursor_pos = cursor_pos
        @board = board
        @cursor = Cursor.new([0,0], board)
        self.render
    end
    def render
        board.rows.each_with_index do |row,i|
            row.each_with_index do |square,j|
                shade = ((i+j) % 2).even? ? :white : :black
                if @cursor_pos == [i,j]
                    print "\e[44m#{" " + square.symbol + " "}\e[0m"
                elsif shade == :black
                    print "\e[43m#{" " + square.symbol + " "}\e[0m"
                else
                    print "\e[47m#{" " + square.symbol + " "}\e[0m"
                end
            end
            print "\n"
        end
    end
end

display = Display.new([0,0],Board.new)
