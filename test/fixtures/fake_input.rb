class FakeInput
  def initialize(plateau, position_1, position_2, commands_1, commands_2)
    @plateau = plateau
    @position_1 = position_1
    @position_2 = position_2
    @commands_1 = commands_1
    @commands_2 = commands_2
  end

  def plateau
    @plateau
  end

  def position_for(rover)
    rover_position = RoverPosition.new(@position_1) if rover.id == 0
    rover_position = RoverPosition.new(@position_2) if rover.id == 1

    rover.update_position(rover_position)

  end

  def commands_for(rover)
    rover.commands.update(@commands_1) if rover.id == 0
    rover.commands.update(@commands_2) if rover.id == 1
  end
end