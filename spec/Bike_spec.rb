require "bike"

describe Bike do
  it "Expects Bike to respond to working?" do
    expect(subject).to respond_to('working?') 
  end
end