require "singleton"
require_relative "piece.rb"

class NullPiece < Piece
    include Singleton 

    attr_reader :symbol
    
    def initialize
        @color = 'grey'
        symbol = :N
    end

    def moves
        raise "Can't move null piece"
    end

end
