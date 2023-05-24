require_relative "piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    attr_reader :color, :symbol
    def initialize
        @color = :gray
    end
   
    def symbol
        " "
    end
end