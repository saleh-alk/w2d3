require_relative "code"

class Mastermind

    def initialize(n)
        @secret_code = Code.random(n)
    end

    def print_matches(code)
        puts code.num_exact_matches(@secret_code)
        puts code.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        puts 'Enter a code'
        guess = gets.chomp
        g = Code.from_string(guess)
        print_matches(g)
        g.pegs == @secret_code

    end

end
