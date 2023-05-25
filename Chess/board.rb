require_relative 'piece'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'pawn'
require_relative 'null_piece'
require "colorize"



class Board
    attr_accessor :rows
    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.instance)}
        @rows[0] = [Rook.new(:black,self,[0,0]),
                    Knight.new(:black,self,[0,1]),
                    Bishop.new(:black,self,[0,2]),
                    King.new(:black,self,[0,3]),
                    Queen.new(:black,self,[0,4]),
                    Bishop.new(:black,self,[0,5]),
                    Knight.new(:black,self,[0,6]),
                    Rook.new(:black,self,[0,7])]
        @rows[1] = [Pawn.new(:black,self,[1,0]),
                    Pawn.new(:black,self,[1,1]),
                    Pawn.new(:black,self,[1,2]),
                    Pawn.new(:black,self,[1,3]),
                    Pawn.new(:black,self,[1,4]),
                    Pawn.new(:black,self,[1,5]),
                    Pawn.new(:black,self,[1,6]),
                    Pawn.new(:black,self,[1,7])]
        @rows[6] = [Pawn.new(:white,self,[6,0]),
                    Pawn.new(:white,self,[6,1]),
                    Pawn.new(:white,self,[6,2]),
                    Pawn.new(:white,self,[6,3]),
                    Pawn.new(:white,self,[6,4]),
                    Pawn.new(:white,self,[6,5]),
                    Pawn.new(:white,self,[6,6]),
                    Pawn.new(:white,self,[6,7])]
        @rows[7] = [Rook.new(:white,self,[7,0]),
                    Knight.new(:white,self,[7,1]),
                    Bishop.new(:white,self,[7,2]),
                    King.new(:white,self,[7,3]),
                    Queen.new(:white,self,[7,4]),
                    Bishop.new(:white,self,[7,5]),
                    Knight.new(:white,self,[7,6]),
                    Rook.new(:white,self,[7,7])]
        @turn = :white
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
        if self[start_pos].is_a?(NullPiece)
            raise 'no piece to move'
        end
        if self[start_pos].color != @turn
            raise 'it is not #{self[start_pos].color}`s turn.'
        end
        if !self[start_pos].moves.include?(end_pos)
            raise 'this piece cannot move here'
        end
        self[end_pos].pos = nil if !self[end_pos].is_a?(NullPiece)
        self[end_pos] = self[start_pos].class.new(self[start_pos].color,self,end_pos)
        self[start_pos] = NullPiece.instance
        self[end_pos].pos
        @turn = @turn == :white ? :black : :white
    end

    def valid_pos?(end_pos)
        row, col = end_pos
        row.between?(0,7) && col.between?(0,7)
    end
    def inspect
        "<Board:#{object_id}>"
    end
end