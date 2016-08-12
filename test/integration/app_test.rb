require './test/test_helper.rb'

describe 'App' do
  describe 'start rovers through controller' do

    fake_input = FakeInput.new(
      Plateau.new(x: 5, y: 5),
      { x: 1, y: 2, heading: 'N' },
      { x: 3, y: 3, heading: 'E' },
      'LMLMLMLMM',
      'MMRMMRMRRM'
    )

    @rover_controller = RoverController.new(data_provider: fake_input)
    @rover_controller.setup
    @rover_controller.start_rovers

    positions = [1, 3, 'N'], [5, 1, 'E']

    @rover_controller.rovers.each do |rover|
      it "return positions of rovers #{rover.id}" do
        position = rover.current_position
        [position.x, position.y, position.heading].must_equal positions[rover.id]
      end
    end
  end
end