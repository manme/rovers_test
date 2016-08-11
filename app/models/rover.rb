class Rover
  attr_reader :id, :positions, :commands, :navigator, :engine
  attr_accessor :plateau

  def initialize(args)
    @id = args[:id]
    @positions = []
    @commands = RoverCommands.new
    @engine = RoverEngine.new
  end

  def update_position(position)
    positions << position
  end

  def current_position
    positions.last
  end
end