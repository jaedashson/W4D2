require "byebug"

require_relative "board.rb"
require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece
    include Slideable
    
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        :R
    end

    protected
    def move_dirs
        horizontal_dirs
    end
end

# board = Board.new 
# rook = Rook.new(:black, board, [2, 0])
# p rook.moves

# rook starts at [2, 0]
# 2,1 -> 2,7
# 3,0 -> 5,0