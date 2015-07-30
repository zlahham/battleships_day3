require 'board'

describe Board do

# let(:ship){ double(:ship, place: true, placed?: true) }
let(:ship){ double(:ship, place: true, confirm_place: :ship, size: 3) }
let(:grid){ double(:grid, insert: true)}

  it "has a ships array" do
    expect(subject.ships).to eq []
  end

  it "responds to place method" do
    expect(subject).to respond_to(:place)
  end

  describe " #place" do

    it 'puts placed ship in ships' do
      subject.place(ship, "A1", grid)
      expect(subject.ships).to include ship
    end

    it 'calls insert method on grid' do
      expect(subject.place(ship, "A1", grid)).to eq(:ship)
    end
  end
end
