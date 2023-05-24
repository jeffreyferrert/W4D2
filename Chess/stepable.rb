module Stepable
    def moves
        valid_moves = []
        row, col = pos
        move_diffs.each do |move|
            dx, dy = move
            new_pos = row + dx, col + dy
            if board.valid_pos?(new_pos) && board[new_pos].is_a?(NullPiece)
                valid_moves << new_pos
            elsif board.valid_pos?(new_pos) && !board[new_pos].is_a?(NullPiece)
                valid_moves << new_pos if board[new_pos].color != color
            end
        end
        valid_moves
    end

    private
    # def move_diffs

    # end
end