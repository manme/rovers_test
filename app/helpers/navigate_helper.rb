class NavigateHelper
  def self.new_position(current_position, command)
    if RoverCommands.rotate?(command)
      current_position.clone_for_rotation(RoverCommands.direction(command))
    else
      current_position.clone_for_move
    end
  end
end