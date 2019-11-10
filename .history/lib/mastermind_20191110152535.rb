require_relative "code"
require "byebug"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        p "exact matches: " + @secret_code.num_exact_matches(code).to_s
        p "near matches: " + @secret_code.num_near_matches(code).to_s
    end

    def ask_user_for_guess
        p "Enter a code"
        
        guess = Code.from_string(gets.chomp)
        

        
        print_matches(guess)
        return guess == @secret_code if guess
    end
end