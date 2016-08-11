class RoverController
  ROVERS_COUNT = 2

  attr_reader :rovers

  def initialize(args)
    @data_provider = args[:data_provider]
    @rovers = []
    ROVERS_COUNT.times { |i| @rovers << Rover.new(id: i) }
  end

  def setup
    plateau = @data_provider.plateau

    @rovers.each do |rover|
      rover.plateau = plateau

      @data_provider.position_for(rover)
      @data_provider.commands_for(rover)
    end
  end

  def start_rovers
    @rovers.each do |rover|
      execute_commands_for(rover)
      print_position_for(rover)
    end
  end

  private

  def execute_commands_for(rover)
    while(command = rover.commands.next)
      new_position = NavigatorHelper.new_position(rover.current_position, command)

      break unless rover.plateau.inside?(new_position) # outside of plateau
      break if cross_any_rovers?(rover, new_position) # meet rovers

      rover.engine.run(command) # emulate motion
      rover.update_position(new_position)
    end
  end

  def cross_any_rovers?(current_rover, new_position)
    @rovers.each do |rover|
      next if rover == current_rover

      return true if rover.current_position.eql?(new_position)
    end

    false
  end

  def print_position_for(rover)
    position = rover.current_position
    p "#{position.x} #{position.y} #{position.heading}"
  end
end