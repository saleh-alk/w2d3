require_relative 'human_player'
require_relative 'board'

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new()
        @k = [@player_1, @player_2]
        @current_player = @k[0]

    end

    def switch_turn
        @k = @k.reverse
        @current_player = @k[0]
        @current_player
    end

    def play
        while @board.empty_positions?
            @board.grid_print
            d = @current_player.get_position
            @board.place_mark(d, @current_player.mark_val)
            if @board.win?(@current_player.mark_val)
                puts 'victory'
                break
            else
                switch_turn
            end
        end
    end
end

g = Game.new('X', '0')
g.play
