class Player
  attr_accessor :mark
  attr_reader :name
  attr_reader :score

  def initialize(name, mark)
    @name = name
    @mark = mark
    @score = 0
  end

  def move
    print '> '
    gets.chomp.strip
  end

  def increment_score
    @score += 1
  end
end
