require 'byebug'

class Board
    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n){ Array.new(n, '_')}
        @n = n
    end

    def valid?(pos)
        if pos[0] >= @n  || pos[1] >= @n
            false
        else
            true
        end
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == '_'
    end

    # def [](pos)
    #     @grid[pos[0]][pos[1]]
    # end

    def place_mark(pos, mark)
        if valid?(pos)== true && empty?(pos) == true
            @grid[pos[0]][pos[1]] = mark
            true
        else
            raise 'error'
        end
    end

    def grid_print
        @grid.each do |row|
            row.each do |ele|
                print "#{ele} "
            end
            puts ""
        end
    end

    def win_row?(mark)
        @grid.each { |ele| return true if ele.all?{|el| el == mark} }
        return false
    end

    def win_col?(mark)
        @grid.transpose.each { |ele| return true if ele.all?{|el| el == mark} }
        false
    end

    def win_diagnol?(mark)
        arr = []
        arr2 = []
        @grid.each_with_index do |ele, i1|
            ele.each_with_index do |el, i2|
                if i1 + i2 == @n - 1
                    arr << el
                end
            end
        end

        @grid.each_with_index do |ele, i1|
            ele.each_with_index do |el, i2|
                if i1 == i2
                    arr2 << el
                end
            end
        end

        if arr2.all?{|ele| ele == mark} || arr.all?{|ele| ele == mark}
            true
        else
            false
        end
    end

    def win?(mark)
        if win_col?(mark) || win_row?(mark) || win_diagnol?(mark)
            return true
        else
            false
        end
    end

    def empty_positions?
        @grid.flatten.any?{|ele| ele == '_'}
    end

    def legal_positions
        arr = []
        @grid.each_with_index do |ele, i1|
            ele.each_with_index do |ele2, i2|
                if @grid[i1][i2] == '_'
                    arr << [i1-1, i2-1]
                end
            end
        end
        arr
    end




end


# b = Board.new(10)
# # p b.valid?([3,2])
# # p b.valid?([2,2])
# # p b.empty?([2,2])
# #p b.place_mark([0,1], 'X')
# # p b.place_mark([0,0], 'X')
# # p b.place_mark([0,2], 'X')
# # p b.place_mark([0,3], 'X')

#  p b.grid_print  ##comeback to
# # p b.win_row?('X')

# p b.place_mark([9, 9], 'X')
# # p b.place_mark([0,2], 'X')
# # p b.place_mark([2,0], 'X')
#p b.grid_print
# # p b.win_diagnol?('X')
# p b.legal_positions
# p b.place_mark([0,1], 'X')
# p b.legal_positions.sample
# p b.legal_positions.sample
# p b.legal_positions.sample
# p b.legal_positions.sample

# #debugger
# b.place_mark([1,2], 'X')
# p place_mark(b.legal_positions.sample, 'X')
# p place_mark(b.legal_positions.sample, 'X')
# p place_mark(b.legal_positions.sample, 'X')
# p place_mark(b.legal_positions.sample, 'X')
# #######  load 'board.rb'
