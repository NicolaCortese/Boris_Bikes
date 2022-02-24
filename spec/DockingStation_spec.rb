require 'dockingstation'

describe DockingStation do
  it "Expects Docking Station instances to respond to release_bike" do
    expect(subject).to respond_to('release_bike') 
  end

  it ".release_bike to release working bike" do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike.usable).to eq true
  end
  
  it "raises an error when all bikes are broken" do
    bike = Bike.new
    bike.broken
    subject.dock(bike)
    expect{subject.release_bike}.to raise_error "Sorry, all bikes are broken"
  end
  
  it "release a bike when other broken bikes are docked" do
    bike_1 = Bike.new
    bike_1.broken
    subject.dock(bike_1)
    bike_2 = Bike.new
    subject.dock(bike_2)
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it ".dock method adds a bike to docking station" do
    bike = Bike.new
    expect(subject.dock(bike)).to include(bike)
  end
  
  it ".dock method adds a bike to docking station even if broken" do
    bike = Bike.new
    bike.broken
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

  describe 'changing the capacity on init'do
    subject { DockingStation.new(capacity)}
    let(:capacity) { 10 }

    it 'changes the capacity to 10 on init' do
      10.times{subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error "Docking station full"
    end


  end


end