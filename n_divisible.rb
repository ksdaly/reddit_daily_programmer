require 'pry'

# SAMPLE INPUT:
# 3 2

class Output
  def initialize
    input = gets.chomp.split(/ /).map!{|num| num.to_i}
    @n = input[0]
    @m = input[1]
  end

  def n_largest
    number = ""
    @n.times { number << "9"}
    number.to_i
  end

  def n_divisible
    n_largest - n_largest % @m
  end
end

puts Output.new.n_divisible
