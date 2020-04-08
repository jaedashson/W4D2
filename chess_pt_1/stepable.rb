module Stepable
    
    def moves 
        moves = []
        cur_row, cur_col = pos
        move_diffs.each do |(d_row, d_col)|
            prop_move = [cur_row + d_row, cur_col + d_col]
            if board.valid_pos?(prop_move) && board[prop_move].color != color
                moves << prop_move
            end
        end
        moves
    end

    private 

    # Why do we need this method
    def move_diffs
        
    end

    


end