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
    if self.length != code.length
      false
    else
      @pegs.each_with_index.all? { |ele, idx| 
        code.pegs[idx] == ele
      }
    end
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index { |peg, idx| 
      count += 1 if @pegs[idx] == peg
    }
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index { |peg, idx| 
      count += 1 if @pegs.include?(peg) && @pegs[idx] != peg
    }
    count
  end

end