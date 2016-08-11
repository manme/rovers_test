class Plateau
  attr_reader :x, :y

  def initialize(args)
    @x = args[:x]
    @y = args[:y]
  end

  def valid?
    x > 0 && y > 0
  end

  def inside?(position)
    position.x >= 0 && position.y >= 0 && position.x <= x && position.y <= y
  end
end