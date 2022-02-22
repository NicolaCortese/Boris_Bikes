require 'dockingstation'
describe DockingStation do
  it "Expects Docking Station instances to respond to release_bike" do
    expect(subject).to respond_to('release_bike') 
  end
  it "Release bike to produce instance of bike class and expects bike to be working" do
    bike = subject.release_bike
    expect(bike).to be_working
    #expect(bike).working?.to eq true
  end
end