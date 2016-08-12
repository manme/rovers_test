require './test/test_helper.rb'

describe 'NavigateHelper' do
  describe '.new_position' do

    params = { x: 0, y: 0, heading: RoverPosition::HEADING.first }
    position = RoverPosition.new(params)

    move_position = NavigateHelper.new_position(position, 'M')
    rotate_position = NavigateHelper.new_position(position, 'L')

    move_params = [move_position.x, move_position.y, move_position.heading]
    rotate_params = [rotate_position.x, rotate_position.y, rotate_position.heading]

    it 'move' do
      move_params.must_equal [0, 1, 'N']
    end

    it 'rotate' do
      rotate_params.must_equal [0, 0, 'W']
    end
  end
end