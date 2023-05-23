require_relative 'piece'
class Board
    attr_accessor :rows
    def initialize
        @rows = Array.new(8) { Array.new(8) { nil }}
        (0..1).each do |i|
            (0..7).each do |j| 
                @rows[i][j] = Piece.new("white",self,[i,j])
            end
        end
        (6..7).each do |i|
            (0..7).each do |j| 
                @rows[i][j] = Piece.new("black",self,[i,j])
            end
        end
    end
    def [](pos)
        row, col = pos
        @rows[row][col]
    end
    def []=(pos,val)
        row, col = pos
        @rows[row][col] = val
    end
    def move_piece(start_pos, end_pos)
        if self[start_pos].nil? 
            raise 'no piece to move'
        end

        if !self[start_pos].valid_move?(end_pos)
            raise 'this piece cannot move here'
        end
    end
end