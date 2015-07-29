require "grid"
describe Grid do

  it 'creates a grid' do
    expect(subject.create_grid.length).to eq(10)
  end

  it 'has a default size' do
    expect(subject.size).to eq(Grid::DEFAULT_SIZE)
  end

  it 'can be set to different sizes' do
    grid = described_class.new({size: 5})
    expect(grid.size).to eq(5)
  end
end
