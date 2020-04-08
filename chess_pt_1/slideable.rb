require "byebug"

module Slideable
    
    HORIZONTAL_DIRS = [
    [ 1,  0], # down
    [ 0,  1], # right
    [-1,  0], # up
    [ 0, -1]  # left
    ]

    DIAGONAL_DIRS = [
    [ 1,  1], # down-right
    [-1,  1], # up-right
    [-1, -1], # up-left
    [ 1, -1]  # down-left
    ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        # debugger # DEBUG
        moves = []
        cur_row, cur_col = pos

        move_dirs.each do |(d_row, d_col)|
            moves.concat(grow_unblocked_moves_in_dir(d_col, d_row)) # call this once per direction
        end

        moves
    end

    
    private 
    def move_dirs
        raise "#move_dirs was not overwritten by piece!"
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        # debugger # Why doesn't debugger stop here?
        moves_in_dir = []

        enemy_color = (color == :black ? :white : :black)

        cur_row, cur_col = pos
        
        keep_searching = true

        while keep_searching 
            prop_move = [cur_row + dy, cur_col + dx]
            # debugger
            if board.valid_pos?(prop_move)
                if board[prop_move].color == color # Encounter our own piece
                    keep_searching = false
                elsif board[prop_move].color == enemy_color # Encounter enemy piece
                    moves_in_dir << prop_move
                    keep_searching = false
                else # Encounter blank space
                    moves_in_dir << prop_move
                    cur_row, cur_col = prop_move
                    keep_searching = true
                end
            else
                keep_searching = false
            end
        end

        moves_in_dir    
    end    
end