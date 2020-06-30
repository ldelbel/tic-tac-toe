class Player
  attr_accessor :mark
  attr_reader :name

  def initialize(name, mark)
    @name = name
    @mark = mark
    @score = 0
  end

  def move
    puts "> "
    input = gets.chomp.strip
  end

  def increment_score
    @score += 1
  end
end

