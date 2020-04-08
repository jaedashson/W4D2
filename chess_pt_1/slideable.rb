

module Slideable
    
    HORIZONTAL_DIRS = [
    [ 1,  0],
    [ 0,  1],
    [-1,  0],
    [ 0, -1]
    ]

    DIAGONAL_DIRS = [
    [ 1,  1],
    [-1,  1],
    [-1, -1],
    [ 1, -1]
    ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    # Leave the same as in Stepable?
    def moves
        moves = []
        cur_row, cur_col = pos

        move_dirs.each do |(d_row, d_col)| # good up to here
            # debugger
            # within this loop, we need to add to add all the possible positions in the current direction
            # call grow_unblocked

            moves.concat(grow_unblocked_moves_in_dir(d_row, d_col)) # call this once per direction
        end

        moves
        # should return ALL POSSIBLE END POSITIONS
    end

    
    private 
    def move_dirs
        raise "#move_dirs was not overwritten by piece!"
    end

    # How does this work?
    # What does this return? => Return an array of all possible positions in that direction
    def grow_unblocked_moves_in_dir(dx, dy)
        moves_in_dir = []

        cur_row, cur_col = pos
        
        keep_searching = true

        while keep_searching 
            enemy_color = (color == :black ? :white : :black)
            
            prop_move = [cur_row + dy, cur_col + dx]

            if board.valid_pos?(prop)
                if board[prop_move].color == color # encounter our own piece
                    keep_searching = false
                
                elsif board[prop_move].color == enemy_color # encounter enemy piece
                    moves_in_dir << prop_move
                    keep_searching = false
                else # encounter blank space
                    moves_in_dir << prop_move
                    cur_row, cur_col = prop_move
                    keep_searching = true
                end
            end
        end

        moves_in_dir    
    end    
end