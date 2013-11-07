require 'pry'

# SAMPLE INPUT:

# 10 10
# ABIGAIL 11 3 5 20 4 2 8 17 4 5
# ALEXANDER 2 12 20 0 6 10 3 4 9 7
# AVA 11 15 2 19 14 5 16 18 15 19
# ETHAN 6 12 0 0 5 11 0 11 12 15
# ISABELLA 16 0 10 7 20 20 7 2 0 1
# JACOB 2 14 17 7 1 11 16 14 14 7
# JAYDEN 10 10 3 16 15 16 8 17 15 3
# MADISON 10 11 19 4 12 15 7 4 18 13
# SOPHIA 5 17 14 7 1 17 18 8 1 2
# WILLIAM 12 12 19 9 4 3 0 4 13 14

class Classroom

  attr_reader :students

  def initialize
    limit = gets.chomp.split(/ /)
    limit[0].to_i.times do
      @students ||= []
      @students << Student.new(gets.chomp.split(/ /))
    end
  end

  def average_grade
    @students.map{|student| student.average_grade}.reduce(:+) / @students.length
  end
end

class Student

  attr_reader :name

  def initialize(input)
    @name = input[0]
    @grades = input[1..-1].map!{|input| input.to_f}
  end

  def average_grade
    @grades.reduce(:+)/@grades.length
  end

end

class Output
  def initialize
    @collection = Classroom.new
  end

  def classroom_average
    puts @collection.average_grade.round(2)
  end

  def student_average
    @collection.students.each do |student|
      puts student.name + " " + student.average_grade.round(2).to_s
    end
  end

  def console
    classroom_average
    student_average
  end

end

Output.new.console
