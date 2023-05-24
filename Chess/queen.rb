require_relative "piece"
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def symbol
        if color == :white
            "♕"
        else
            "♛"
        end
    end
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end