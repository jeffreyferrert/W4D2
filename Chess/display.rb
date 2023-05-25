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
        message = nil
        counter = 0
        start_pos = nil
        end_pos = nil
        while true
        render
        if counter == 1
            print message
            print "Where would you like to move it?\n"
        end
        prev_pos = @cursor_pos
        @cursor_pos = @cursor.get_input
        if @cursor_pos == prev_pos
            counter += 1
            if counter == 1
                start_pos = @cursor_pos
                message = "The #{board[start_pos].color} #{board[start_pos].class} at #{start_pos} has been selected\n"
            else
                end_pos = @cursor_pos
                begin
                board.move_piece(start_pos,end_pos)
                rescue RuntimeError => e
                    puts e.message
                end
                counter = 0
            end
        end
        @cursor_pos = prev_pos if @cursor_pos.nil?
        system("clear")
        end
    end
end

display = Display.new([1,1],Board.new)
display.run