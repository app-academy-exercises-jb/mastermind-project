require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        p "exact matches: " + @secret_code.num_exact_matches(code)
        p "near matches: " + @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        p "Enter a code"
        guess = Code.from_string(gets.chomp)
        print_matches(guess)
        return guess == @secret_code
    end
end


__END__

rspec ./spec/mastermind_spec.rb:45 # Mastermind PART 3 #ask_user_for_guess should print 'Enter a code'
rspec ./spec/mastermind_spec.rb:51 # Mastermind PART 3 #ask_user_for_guess should call gets.chomp to get input from the user 
rspec ./spec/mastermind_spec.rb:60 # Mastermind PART 3 #ask_user_for_guess should call Code::from_string with the user's entered string
rspec ./spec/mastermind_spec.rb:69 # Mastermind PART 3 #ask_user_for_guess should print the number of exact and near matches between @secret_code and the user's guessed code
rspec ./spec/mastermind_spec.rb:76 # Mastermind PART 3 #ask_user_for_guess should return a boolean indicating whether the user's guessed code is equal to @secret_code