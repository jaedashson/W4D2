class Piece

    attr_reader :color, :board, :pos

    def initialize(color=nil, board=nil, pos=nil)
        @color = :black
        @board = board
        @pos = pos
    end
    
    def to_s
        symbol.to_s
    end

    def symbol
        raise "#symbol was not overwritten in subclass"
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        board.valid_pos?(pos)
    end

    # When do we use this?
    # Update the piece's position on the board after it's been moved on the board
    def pos=(val)
        possible_moves = valid_moves(pos)

        @pos = val if possible_moves.include?(val) 
    end

    private 

    def move_into_check?(end_pos)
    end
end

