require 'board'

describe Board do

# let(:ship){ double(:ship, place: true, placed?: true) }
let(:ship){ double(:ship, place: true, confirm_place: :ship, size: 3, direction: :horizontal) }
let(:ship2){ double(:ship, place: true, confirm_place: :ship, size: 3, direction: :horizontal) }
# let(:grid){ double(:grid, insert: true)}

  it "has a ships array" do
    expect(subject.ships).to eq []
  end

  it "responds to place method" do
    expect(subject).to respond_to(:place)
  end

  describe " #place" do

    it 'puts placed ship in ships' do
      subject.place(ship, "A1")
      expect(subject.ships).to include ship
    end

    xit 'calls insert method on grid' do

      expect(subject.place(ship, "A1")).to eq(:ship)
    end

    xit 'it places ships with a  default direction of horizontal' do
      expect(subject.place(ship, "A1")).to eq(:vertical)
    end

    xit 'can change a ships direction to vertical' do
      ship = described_class.destroyer(:horizontal)
      expect(ship.direction).to eq(:horizontal)
    end

    it 'does not allow 2 ships on same cell' do
      subject.place(ship, "b1", :horizontal)
      expect{subject.place(ship2, "a1", :horizontal)}.to raise_error "Not available"
    end
  end
end
