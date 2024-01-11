# 
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def throw_ball
    rand(0..10)
  end
end
