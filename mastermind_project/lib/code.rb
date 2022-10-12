class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all?{|ele| POSSIBLE_PEGS.include?(ele.upcase)}
  end

  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise 'error'
    else
      @pegs = chars.map!{|el| el.upcase}
    end
  end

  def self.random(length)
    arr = []
    length.times { arr << POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |ele, i1|
        @pegs.each_with_index do |peg, i2|
          if i1 == i2 && ele ==peg
            count += 1
          end
        end
    end
    count
  end

  def num_near_matches(code)
    c = code.pegs
    b = @pegs
    count = 0
    c.each_with_index do |ele, i1|
        b.each_with_index do |peg, i2|
          if i1 == i2 && ele == peg
            c[i1] = '_'
            b[i2] = '_'
          end
        end
    end

    c.each_with_index do |ele, i1|
      b.each_with_index do |peg, i2|
        if c.include?(peg) && peg != '_'
          count += 1
          c[c.index(peg)] = '_'
          b[b.index(peg)] = '_'
        end
      end
    end

    count

  end

  def ==(code)
     self.pegs == code.pegs
  end



end

# require 'byebug'

# debugger

# code = Code.new(['R', 'G', 'R', 'B'])

# p code.num_near_matches(Code.new(["G", "R", "R", "R"]))
