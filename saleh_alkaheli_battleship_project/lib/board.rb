class Board

    attr_reader :size, :n

    def initialize(n)
        @grid = Array.new(n){ Array.new(n, :N)}
        @size = n * n
        @n = n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]]= val
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
        return count
    end

    def attack(pos)
        if self[pos] != :S
            self[pos]=  :X
            false
        else
            self[pos]= :H
            puts 'you sunk my battleship!'
            true
        end

    end

    def place_random_ships
        until @grid.flatten.count{|ele| ele == :S} == @size/4
            m = rand(0..@n-1)
            k = rand(0..@n-1)
            @grid[m][k] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(Math.sqrt(@size)) {Array.new(Math.sqrt(@size))}
        @grid.each_with_index do |ele, i1|
            ele.each_with_index do |el, i2|
                if @grid[i1][i2] == :S
                    hidden_grid[i1][i2] = :N
                else
                    hidden_grid[i1][i2] = @grid[i1][i2]
                end
            end
        end
        return hidden_grid
    end

    def self.print_grid(arr)
        arr.each do |ele|
            ele.each_with_index do |el, i|
                if i != ele.length-1
                    print el.to_s + ' '
                else
                    print el.to_s
                end
            end
            puts
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end

# d = Board.new(5)
# d.place_random_ships
# d.cheat
# d.attack([2,2])
