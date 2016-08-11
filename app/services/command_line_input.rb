class CommandLineInput
  class << self
    def plateau
      loop do
        coordinates = read_data.split(' ').collect! { |v| v.to_i }
        plateau = Plateau.new(x: coordinates[0], y: coordinates[1])

        return plateau if plateau.valid?
      end
    end

    def position_for(rover)
      loop do
        position = read_data.split(' ')

        params = {
          x: position[0].to_i,
          y: position[1].to_i,
          heading: position[2]
        }

        rover_position = RoverPosition.new(params)

        if rover_position.valid? && rover.plateau.inside?(rover_position)
          rover.update_position(rover_position)
          break
        end
      end
    end

    def commands_for(rover)
      loop do
        rover.commands.update(read_data)

        return if rover.commands.valid?
      end
    end

    def read_data
      gets.chomp
    end
  end
end