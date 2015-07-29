require "cell"

describe Cell do

  it "contains water by default" do
    cell = described_class.new({content: :water})
    expect(cell.content).to eq(:water)
  end
end
