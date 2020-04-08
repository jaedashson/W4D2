require_relative "board.rb"
require_relative "piece.rb"

class Pawn < Piece

    # BLACK_MOVES = [
    # [ 1,  0],
    # ]

    # BLACK_MOVES_FIRST = [
    # [ 1,  0],
    # [ 2,  0]
    # ]

    # WHITE_MOVES = [
    # [-1,  0]
    # ]

    # WHITE_MOVES_FIRST = [
    # [-1,  0],
    # [-2,  0]
    # ]

    # BLACK_ATTACK = [
    # [ 1, -1],
    # [ 1,  1]
    # ]
    
    # WHITE_ATTACK = [
    # [ -1, -1],
    # [ -1,  1]
    # ]
        
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        :P
    end

    def moves
        forward_steps + side_attacks
    end

    private 

    # pos = [row, col]
    def at_start_row
        pos[0] == (color == :black ? 1 : 6)
    end

    def forward_dir
        color == :black ? 1 : -1
    end

    # Returns an array of positions that the pawn is able to go to
    # Am I blocked?
    # Use forward_dir as helper method
    def forward_steps
        forward_steps = []

        prop_move = pos.dup
        prop_move[0] += forward_dir

        
        if board.valid_pos?(prop_move) && board[prop_move].symbol == :N # If position is valid and empty
            forward_steps << prop_move

            if at_start_row
                prop_move[0] += forward_dir

                forward_steps << prop_move if board[prop_move].symbol == :N
            end
        end
        
        forward_steps    
    end

    # Returns a diagonal position if there is an enemy there
    # Use forward_dir as helper method
    def side_attacks
        side_attacks = []

        enemy_color = (color == :black ? :white : :black)

        cur_row, cur_col = pos

        prop_attacks = [[cur_row + forward_dir, cur_col -1], [cur_row + forward_dir, cur_col + 1]]

        prop_attacks.each do |prop_attack|
            if board.valid_pos?(prop_attack) && board[prop_attack].color = enemy_color
                side_attacks << prop_attack
            end
        end

        side_attack
    end
    
end