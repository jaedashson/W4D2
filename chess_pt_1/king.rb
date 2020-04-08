require_relative "board.rb"
require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece

    include Stepable

    MOVES = [
    [ 1,  0],
    [ 1,  1],
    [ 0,  1],
    [-1,  1],
    [-1,  0],
    [-1, -1],
    [ 0, -1],
    [ 1, -1]
    ]

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    protected

    def move_diffs
        MOVES
    end
    
end

board = Board.new
king = King.new(:white, board, [7,4])
p king.moves