require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable
    MOVE_DIFFS = [[0,1],[0,-1],[1,1],[1,0],[1,-1],[-1,1],[-1,0],[-1,-1]]
    def move_diffs
        MOVE_DIFFS
    end
end