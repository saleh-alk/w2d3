require_relative 'human_player'
require_relative 'board'
require_relative 'computer_player'
require 'byebug'
class Game
    def initialize(n, player_mark)
        @player = []
        player_mark.each do |k,v|
            if v == true
                @player << ComputerPlayer.new(k)
            else
                @player << HumanPlayer.new(k)
            end
        end

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
            k = @board.legal_positions
            d = @current_player.get_position(k)

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

# g = Game.new(4, 'X', 'O', 'R')
# g.play

machine_civil_war = Game.new(10, h: true, u: true, e: true)
#debugger
machine_civil_war.play


#[["_", :u, "_", "_", "_", "_", "_", "_", "_", "_"], [:h, "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"]]
