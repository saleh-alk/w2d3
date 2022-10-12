#require_relative 'board'

class HumanPlayer

    attr_reader :mark_val

    def initialize(mark_val)
        @mark_val = mark_val
    end

    def get_position(legal_positions)
        puts 'Choose two numbers from 0-2 to place your mark. Seperate with a space'
        input = gets.chomp
        k = input.split(' ')
        k.map!{ |ele| ele.to_i}
    end

end

# h = HumanPlayer.new('X')
# p h.get_position()
