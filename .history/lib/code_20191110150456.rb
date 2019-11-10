require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.include?(peg.upcase) }
  end

  def self.random(length)
    pegs = []
    length.times { |i| pegs << POSSIBLE_PEGS.keys[rand(POSSIBLE_PEGS.length)] }
    Code.new(pegs)
  end

  def self.from_string(pegs)
    if valid_pegs?(pegs.chars)
      Code.new(pegs.chars)
    end
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs) 
      @pegs = pegs.map(&:upcase)
    else
      raise "invalid pegs"
    end
  end

  def pegs
    @pegs
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def ==(code)
    self.length == code.pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index { |peg, idx| 
      count += 1 if @pegs[idx] == peg
    }
    count
  end

  def num_near_matches
    count = 0
    debugger
    guess.pegs.each_with_index { |peg, idx| 
      count += 1 if @pegs[idx] == peg
    }
    count
  end

end


__END__

rspec ./spec/code_spec.rb:123 # Code PART 2 #num_exact_matches should accept a Code instance representing a guess
rspec ./spec/code_spec.rb:127 # Code PART 2 #num_exact_matches should return the number of pegs in the guess that are the correct color and position as @pegs
rspec ./spec/code_spec.rb:135 # Code PART 2 #num_near_matches should accept a Code instance representing a guess
rspec ./spec/code_spec.rb:139 # Code PART 2 #num_near_matches should return the number of pegs in the guess that are the correct color but incorrect position compared to @pegs
rspec ./spec/code_spec.rb:143 # Code PART 2 #num_near_matches should not include exact matches
rspec ./spec/code_spec.rb:151 # Code PART 2 #== should accept another Code instance as an arg
rspec ./spec/code_spec.rb:156 # Code PART 2 #== should return a boolean indicating whether the arg exactly matches self
rspec ./spec/code_spec.rb:164 # Code PART 2 #== should return false if the arg has different length from self