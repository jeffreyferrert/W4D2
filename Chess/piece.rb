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
        print "pos is #{pos}, move is #{move} \n"
        end_pos = [row + move[0], col + move[1]]
        #print "we're looking at #{end_pos}, which has a #{board[end_pos].class} with color #{board[end_pos].color} \n"
        if end_pos[0].between?(0,7) && end_pos[1].between?(0,7)
            if board[end_pos].is_a?(NullPiece)
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