require_relative "piece"

class Pawn < Piece
    SIDE_ATTACKS = [[1,1],[1,-1]]
    FORWARD_DIR = [[1,0],[2,0]]

    def symbol

    end
    def moves
        poss_moves = []

        if at_start_row?
            poss_moves += forward_steps
        else
            poss_moves += forward_dir
        end
        row, col = pos
        valid_moves = poss_moves.select do |move|
            (row+move[0]).between?(0,7) || (col+move[1]).between?(0,7)
        end
        valid_moves += side_attacks.select do |move|
            (row+move[0]).between?(0,7) || (col+move[1]).between?(0,7) &&
            (!board[[row+move[0],col+move[1]]].nil? && board[[row+move[0],col+move[1]]].color != color)
        end
        valid_moves.map {|move| [row+move[0],col+move[1]]}
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