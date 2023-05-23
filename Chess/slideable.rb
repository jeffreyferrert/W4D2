module Slideable
    HORIZONTAL_DIRS = [[0,1],[1,0],[0,-1],[-1,0]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    def diagonal_dirs
        DIAGONAL_DIRS
    end
    def moves
        valid_moves = []
        move_dirs.each do |dir|
            valid_moves += grow_unblocked_moves_in_dir(*dir)
        end
        valid_moves
    end

    private
    # def move_dirs

    # end
    def grow_unblocked_moves_in_dir(dx,dy)
        unblocked_moves = []
        row, col = pos
        current_pos = row + dx, col + dy
        until (!(row+dx).between?(0,7) || !(col+dy).between?(0,7)) || !board[current_pos].nil?
            unblocked_moves << current_pos
            row, col = current_pos
            current_pos = row + dx, col + dy
        end
        if (row+dx).between?(0,7) && (col+dy).between?(0,7)
            unblocked_moves << current_pos if board[current_pos].color != color
        end
        unblocked_moves
    end
end
