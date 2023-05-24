require_relative "stepable"
require_relative "piece"

class Knight < Piece
    include Stepable
    MOVE_DIFFS = [[2,1],[-2,1],[2,-1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
    def symbol
        if color == :white
            "♘"
        else
            "♞"
        end
    end
    def move_diffs
        MOVE_DIFFS
    end
end