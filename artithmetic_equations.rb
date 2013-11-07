require 'pry'

# SAMPLE INPUT/OUTPUT:
# 0 10
# > 3 * 2 + 5 * 2
# 16
# > Correct!
# > 0 - 10 + 9 + 2
# 2
# > Incorrect...
# > 0 - 10 + 9 + 2
# 3
# > Incorrect...
# > 0 - 10 + 9 + 2
# 1
# > Correct!
# > 2 * 0 * 4 * 2
# 0
# > Correct!
# q

class Output
  def initialize
     @range = gets.chomp.split(/ /).map!{|n| n.to_i}
  end

  def random_number
    rand(@range[0]..@range[1])
  end

  def random_operator
    [:+, :-, :*].sample
  end

  def equation
    eq = "#{random_number}"
    3.times {eq << " #{random_operator} #{random_number}"}
    eq
  end
end

class Game
  def initialize
    @output = Output.new
  end

  def play
    while true
      question = @output.equation
      evaluate_question(question)
    end
  end

  def evaluate_question(question)
    puts question
    answer = gets.chomp
    if answer.downcase == 'q'
      exit
    elsif answer.chomp.to_i == eval(question)
      puts "Correct!"
    else
      puts "Try again!"
      evaluate_question(question)
    end
  end
end

Game.new.play
