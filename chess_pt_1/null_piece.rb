require "singleton"
require_relative "piece.rb"

class NullPiece < Piece
    include Singleton 

    attr_reader :symbol
    
    def initialize
        @color = 'grey'
        @symbol = :O
    end

    def moves
        raise "Can't move NullPiece!"
        # Or return []
    end
end
