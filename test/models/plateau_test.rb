require './test/test_helper.rb'

describe 'Plateau' do
  describe '#valid?' do

    it 'zero coordinate' do
      Plateau.new(x: 0, y: 10).valid?.must_equal false
    end

    it 'negative coordinate' do
      Plateau.new(x: -10, y: 10).valid?.must_equal false
    end

    it 'positive coordinates' do
      Plateau.new(x: 10, y: 10).valid?.must_equal true
    end
  end

  describe '#inside?' do

    plateau = Plateau.new(x: 10, y: 10)
    inside = RoverPosition.new(x: 0, y: 10)
    outside = RoverPosition.new(x: 5, y: 11)

    it 'position inside' do
      plateau.inside?(inside).must_equal true
    end

    it 'position outside' do
      plateau.inside?(outside).must_equal false
    end
  end
end