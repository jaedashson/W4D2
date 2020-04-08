require_relative "board.rb"
require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece

    include Slideable
    
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        :B
    end

    protected
    def move_dirs
        diagonal_dirs # module method
    end
    
end