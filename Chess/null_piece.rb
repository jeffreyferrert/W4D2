require_relative "piece"

class NullPiece < Piece
    attr_reader :color, :symbol
    include Singleton
   
end