class Piece

    attr_reader :color, :board, :pos

    def initialize(color=nil, board=nil, pos=nil)
        @color = :black
        @board = board
        @pos = pos
    end
    
    # Returns the symbol as a string
    def to_s
        symbol
    end

    def symbol
        raise "#symbol was not overwritten in subclass"
    end

    # What does this do?
    def empty?
        
    end

    def valid_moves
        board.valid_pos?(pos) # check if within board 
    end

    # Is this correct?
    def pos=(val)
        possible_moves = valid_moves(pos)

        @pos = val if possible_moves.include?(val) 
    end

    private 

    def move_into_check?(end_pos)
    end
    
end

