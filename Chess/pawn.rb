require_relative "piece"

class Pawn < Piece
    SIDE_ATTACKS = [[1,1],[-1,1]]
    FORWARD_DIR = [[0,1],[0,2]]

    def symbol

    end
    def moves
        pos_moves = []

        if at_start_row?
            pos_moves += forward_steps
        else
            pos_moves += forward_dir
        end
        row, col = pos
        side_attacks.each do |move|
            dx, dy = move
            pos_enemy = board(row+dx,col+dy)
            if !pos_enemy.nil? && pos_enemy.color != color
                pos_moves << move
            end
        end
        valid_moves = pos_moves.select do |move|
            (row+move[0]).between?(0,1) || (col+move[1]).between?(0,7)
        end
        valid_moves
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
            valid_moves.map {|move| move[1] = move[1]*(-1)}
        end
    end
    def forward_steps
        valid_moves = FORWARD_DIR.take(2)
        if color == :white
            valid_moves.map {|move| move[1] = move[1]*(-1)}
        end
    end
    def side_attacks
        valid_moves = SIDE_ATTACKS
        if color == :white
            valid_moves.map {|move| move[1] = move[1]*(-1)}
        end
    end
end