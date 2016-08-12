require './test/test_helper.rb'

describe 'RoverCommand' do
  describe 'iterate through commands' do

    size = 20
    commands = (0...size).map{ RoverCommands::COMMANDS[rand(3)]}.join

    rover_commands = RoverCommands.new(commands)

    it 'get coordinate with next' do
      size.times do |i|
        rover_commands.current.must_equal commands[i]
        rover_commands.next.must_equal commands[i]
      end
    end
  end

  describe '#valid?' do

    commands = (0...10).map{ RoverCommands::COMMANDS[rand(3)]}.join
    good_rover_commands = RoverCommands.new(commands)
    bad_rover_commands = RoverCommands.new(commands+ 'O')

    it 'good commands' do
      good_rover_commands.valid?.must_equal true
    end

    it 'bad commands' do
      bad_rover_commands.valid?.must_equal false
    end
  end

  describe '.rotate?' do
    it 'rotation command' do
      %w(L R).each do |command|
        RoverCommands.rotate?(command).must_equal true
      end
    end

    it 'not a rotation' do
      RoverCommands.rotate?('M').must_equal false
    end
  end

  describe '.direction' do
    it 'left' do
      RoverCommands.direction('L').must_equal -1
    end

    it 'right' do
      RoverCommands.direction('R').must_equal 1
    end
  end
end