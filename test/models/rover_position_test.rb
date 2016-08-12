require './test/test_helper.rb'

describe 'RoverPosition' do
  describe '#valid?' do

    it 'zero coordinate' do
      RoverPosition.new(x: 0, y: 10, heading: 'N').valid?.must_equal false
    end

    it 'wrong heading' do
      RoverPosition.new(x: 10, y: 10, heading: 'H').valid?.must_equal false
    end

    it 'good parameters' do
      RoverPosition.new(x: 10, y: 10, heading: 'S').valid?.must_equal true
    end
  end

  describe '#eql?' do

    rover_position_1 = RoverPosition.new(x: 10, y: 10, heading: 'S')
    rover_position_2 = RoverPosition.new(x: 0, y: 10, heading: 'S')

    it 'same coordinates' do
       rover_position_1.eql?(rover_position_1).must_equal true
    end

    it 'different coordinates' do
      rover_position_1.eql?(rover_position_2).must_equal false
    end
  end

  describe '#clone_for_rotation' do
    params = { x: 0, y: 0, heading: RoverPosition::HEADING.first }
    rover_position_left = RoverPosition.new(params)
    rover_position_right = RoverPosition.new(params)

    20.times do |i|
      rover_position_left = rover_position_left.clone_for_rotation(-1)
      rover_position_right = rover_position_right.clone_for_rotation(1)

      h1 = rover_position_left.heading
      h2 = RoverPosition::HEADING[-(i+1) % 4]

      it 'change heading left' do
        h1.must_equal h2
      end

      h1 = rover_position_right.heading
      h2 = RoverPosition::HEADING[(i+1) % 4]

      it 'change heading right' do
        h1.must_equal h2
      end
    end
  end

  describe '#clone_for_move' do
    x, y = 10, 10

    RoverPosition::HEADING.each_with_index do |heading, index|
      rover_position = RoverPosition.new(x: x, y: y, heading: heading)
      new_position = rover_position.clone_for_move

      movement = RoverPosition::HEADING_MOVEMENT[index]

      it 'change position' do
        new_position.x.must_equal (movement[0] + x)
        new_position.y.must_equal (movement[1] + y)
      end
    end

  end
end