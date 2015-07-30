require "grid"

describe Grid do

  let(:cell) { double(:cell, create: true, content: true) }
  let(:ship) { double(:ship, size: 3, direction: :horizontal) }
  let(:vertical_ship) { double(:ship, size: 3, direction: :vertical) }

  it 'has a default size' do
    expect(subject.size).to eq(Grid::DEFAULT_SIZE)
  end

  it 'can be set to different sizes' do
    grid = described_class.new({size: 5, content: cell})
    expect(grid.size).to eq(5)
  end

  it 'will be filled with objects on creation' do
    grid = described_class.new({size: 5, content: cell})
    expect(grid.grid_locations.all?).to eq(true)
  end

  describe ' #insert' do
    it 'inserts ship into location' do
      subject.insert(ship,"A1", :horizontal)
      expect(subject.grid_locations[0][0].content).to eq(ship)
    end

    it 'inserts ship into locations relative to size - horizontally' do
      subject.insert(ship, "A1", :horizontal)
      expect(subject.grid_locations[0][2].content).to eq(ship)
    end

    it 'inserts ship into locations relative to size - vertically' do
      subject.insert(vertical_ship, "A1", :vertical)
      expect(subject.grid_locations[2][0].content).to eq(vertical_ship)
    end

  end


end
