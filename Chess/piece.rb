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
    def valid_moves
        false #placeholder
    end
    def pos=(val)

    end
    def symbol

    end

    private
    def move_into_check?(end_pos)

    end
end