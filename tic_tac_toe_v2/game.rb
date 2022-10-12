require_relative 'human_player'
require_relative 'board'

class Game
    def initialize(n, *player_mark)
        @player = []
        player_mark.each { |ele| @player << HumanPlayer.new(ele) }

        @board = Board.new(n)

        @current_player = @player[0]

    end

    def switch_turn
        @player = @player.rotate
        @current_player = @player[0]
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

g = Game.new(4, 'X', 'O', 'R')
g.play
