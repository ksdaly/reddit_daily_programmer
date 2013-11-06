require 'pry'

# Force = (Particle 1's mass x Particle 2's mass) / Distance^2
# deltaX = (Particle 1's x-position - Particle 2's x-position)
# deltaY = (Particle 1's y-position - Particle 2's y-position)
# Distance = Square-root( deltaX * deltaX + deltaY * deltaY )

# SAMPLE INPUT 1:
# 1 -5.2 3.8
# 1 8.7 -4.1
# SAMPLE INPUT 2:
# 4 0.04 -0.02
# 4 -0.02 -0.03
class Repulsion

  def initialize
    @particle_one = normalize_input
    @particle_two = normalize_input
  end

  def delta(value)
    @particle_one[value] - @particle_two[value]
  end

  def distance
    Math.sqrt(delta(:x_position) ** 2 + delta(:y_position) ** 2)
  end

  def force
    (@particle_one[:mass] * @particle_two[:mass]) / distance ** 2
  end

  def output
    puts force.round(4)
  end

  private

  def normalize_input
    keys = [:mass, :x_position, :y_position]
    inputs = gets.chomp.split(/ /).map!{|x| x.to_f}
    hash = Hash[keys.zip(inputs)]
  end

end

Repulsion.new.output
