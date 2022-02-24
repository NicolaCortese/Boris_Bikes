require "bike"

describe Bike do
  it "Expects Bike to respond to broken?" do
    expect(subject).to respond_to('broken') 
  end

  it "checks if a bike is not working" do
    expect(subject.broken).to eq false
  end
end
