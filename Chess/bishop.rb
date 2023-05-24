require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable

    def symbol
        if color == :white
            "♗"
        else
            "♝"
        end
    end
    def move_dirs
        diagonal_dirs
    end
end