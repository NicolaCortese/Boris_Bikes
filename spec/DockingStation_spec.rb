require 'dockingstation'

describe DockingStation do
  it "Expects Docking Station instances to respond to release_bike" do
    expect(subject).to respond_to('release_bike') 
  end

  it ".release_bike to produce instance of bike class and expects bike to be working" do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it ".dock method adds a bike to docking station" do
    bike = Bike.new
    expect(subject.dock(bike)).to include(bike)
  end

  it "Raises an error if there are no bikes" do
    subject.bikes = []
    expect { subject.release_bike }.to raise_error "Sorry, there are no bikes"
  end

  it 'Raises an error if when docking at the docking station there is no more capacity' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    expect{ subject.dock(Bike.new) }.to raise_error "Docking station full"
  end

end