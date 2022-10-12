require_relative 'board'

class ComputerPlayer

    attr_reader :mark_val

    def initialize(mark_val)
        @mark_val = mark_val
    end

    def get_position(legal_positions)
        puts "computer #{@mark_val} chooses"
        legal_positions.sample
    end

end
