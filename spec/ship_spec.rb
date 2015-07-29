require "ship"

describe Ship do

   it "starts game not placed" do
    expect(subject).not_to be_placed
  end
end