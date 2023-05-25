require_relative "piece"

class Pawn < Piece
    SIDE_ATTACKS = [[1,1],[1,-1]]
    FORWARD_DIR = [[1,0],[2,0]]

    def symbol
        color == :white ? "♙" : "♟︎"
    end
    def moves
        valid_moves = []
        
        if at_start_row?
            valid_moves.concat(forward_steps)
        else
            valid_moves.concat(forward_dir)
        end
        row, col = pos
        valid_moves = valid_moves.reject {|move| !valid?(move)}
        side_attacks.each do |move|
            end_pos = row + move[0], col + move[1]
            if (valid?(move) && !board[end_pos].is_a?(NullPiece))
                valid_moves << move
            end
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
        valid_moves = FORWARD_DIR.dup.take(1)
        if color == :white
            valid_moves.map! {|move| [move[0]*(-1),move[1]]}
        end
        valid_moves
    end
    def forward_steps
        valid_moves = FORWARD_DIR.dup.take(2)
        if color == :white
            valid_moves.map! {|move| [move[0]*(-1),move[1]]}
        end
        valid_moves
    end
    def side_attacks
        valid_moves = SIDE_ATTACKS.dup
        if color == :white
            valid_moves.map! {|move| [move[0]*(-1),move[1]]}
        end
        valid_moves
    end
end