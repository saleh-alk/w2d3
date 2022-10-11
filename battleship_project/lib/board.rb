class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n){ Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        @grid.each do |ele|
            ele.each do |el|
                if el == :S
                    count+=1
                end
            end
        end
        count
    end
end
