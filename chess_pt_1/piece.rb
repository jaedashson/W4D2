class Piece
    def initialize(color=nil, board=nil, pos=nil)
        @color = color
        @board = board
        @pos = pos
    end
    
    def to_s
        "p"
    end

    def empty?
    end
    
end

