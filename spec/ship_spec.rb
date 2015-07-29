require "ship"

describe Ship do

  it "starts game not placed" do
    expect(subject).not_to be_placed
  end

  it 'cannot place the same ship more than once' do
    subject.confirm_place
    expect{subject.confirm_place}.to raise_error "Ship has already been placed"
  end

  it 'is placed once placed' do
    subject.confirm_place
    expect(subject).to be_placed
  end

end
