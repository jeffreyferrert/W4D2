require_relative "piece"

class Pawn < Piece
    SIDE_ATTACKS = [[1,1],[1,-1]]
    FORWARD_DIR = [[1,0],[2,0]]

    def symbol
        if color == :white
            "♙"
        else
            "♟︎"
        end
    end
    def moves
        valid_moves = []
        if at_start_row?
            valid_moves += forward_steps
        else
            valid_moves += forward_dir
        end
        row, col = pos
        valid_moves.reject! do |move|
            !valid?(move)
        end
        valid_moves += side_attacks.select do |move|
            valid?(move) && !board[[row + move[0], col + move[0]]].is_a?(NullPiece)
        end
        valid_moves.map {|move| [row + move[0],col + move[1]]}
    end

    private
    def at_start_row?
        if color == :black
            return pos[0] == 1
        else
            return pos[0] == 6
        end
    end
    def forward_dir
        valid_moves = FORWARD_DIR.take(1)
        if color == :white
            valid_moves.map {|move| [move[0]*(-1),move[1]]}
        end
    end
    def forward_steps
        valid_moves = FORWARD_DIR.take(2)
        if color == :white
            valid_moves.map {|move| [move[0]*(-1),move[1]]}
        end
    end
    def side_attacks
        valid_moves = SIDE_ATTACKS
        if color == :white
            valid_moves.map {|move| [move[0]*(-1),move[1]]}
        end
    end
end