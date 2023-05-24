class Piece
    attr_accessor :pos
    attr_reader :color, :board
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?

    end
    def valid?(move)
        row, col = pos
        end_pos = [row + move[0], col + move[1]]
        if end_pos[0].between?(0,7) && end_pos[1].between?(0,7)
            if board[end_pos].nil?
                return true
            elsif board[end_pos].color != color
                return true
            end
        end
        false
    end
    def pos=(val)

    end
    def symbol

    end

    private
    def move_into_check?(end_pos)

    end
    def inspect
        "<#{object_id}>"
    end
end