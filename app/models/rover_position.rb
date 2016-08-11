class RoverPosition
  HEADING = %w(N E S W)
  HEADING_MOVEMENT = [[0, 1], [1, 0], [0, -1], [-1, 0]]

  attr_reader :x, :y, :heading

  def initialize(args)
    @x = args[:x]
    @y = args[:y]
    @heading = args[:heading]
  end

  def valid?
    HEADING.include?(heading) && x > 0 && y > 0
  end

  def clone_for_rotation(direction)
    RoverPosition.new(x: x, y: y, heading: heading_for(direction))
  end

  def clone_for_move
    coords = coords_for_move
    RoverPosition.new(x: coords[0], y: coords[1], heading: heading)
  end

  def eql?(position)
    x == position.x && y == position.y
  end

  private

  def heading_for(direction)
    return HEADING[0] if (index_heading == 3 && direction > 0)
    HEADING[index_heading + direction]
  end

  def coords_for_move
    movement = HEADING_MOVEMENT[index_heading] # [dx, dy]
    [x, y].zip(movement).map { |coord| coord.inject(:+) } # [x + dx, y + dy]
  end

  def index_heading
    HEADING.index(heading)
  end
end