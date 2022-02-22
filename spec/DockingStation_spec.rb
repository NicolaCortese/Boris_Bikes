require 'dockingstation'
describe DockingStation do
  it "Expects Docking Station instances to respond to release_bike" do
    expect(subject).to respond_to('release_bike') 
  end
end