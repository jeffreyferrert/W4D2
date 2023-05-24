module Stepable
    def moves
        valid_moves = []
        row, col = pos
        move_diffs.each do |move|
            dx, dy = move
            new_pos = row + dx, col + dy
            if ((row+dx).between?(0,7) && (col+dy).between?(0,7)) && board[new_pos].nil?
                print "#{new_pos} is a valid move! \n"
                valid_moves << new_pos
            elsif ((row+dx).between?(0,7) && (col+dy).between?(0,7)) && !board[new_pos].nil?
                print "#{new_pos} is a valid move! \n"
                valid_moves << new_pos if board[new_pos].color != color
            end
        end
        valid_moves
    end

    private
    # def move_diffs

    # end
end