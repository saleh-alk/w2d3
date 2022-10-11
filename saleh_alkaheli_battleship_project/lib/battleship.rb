require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = n*n/2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print 'you lose'
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            print 'you win'
            true
        else
            false
        end
    end

    def game_over?
        if win? || lose?
            true
        else
            false
        end
    end

    def turn
        k =@player.get_move
        if !@board.attack(k)
            @remaining_misses -= 1
        end

        @board.print
        print @remaining_misses

    end



end


# b = Battleship.new(5)
# b.start_game
