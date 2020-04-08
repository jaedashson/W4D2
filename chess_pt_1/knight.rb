require_relative "board.rb"
require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece
    include Stepable

    attr_reader :symbol

    MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
    ]
    
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    protected 

    def move_diffs
        MOVES
    end
    
    
end

# board = Board.new
# knight = Knight.new(:white, board, [0, 1])
# p knight.moves