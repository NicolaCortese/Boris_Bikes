require 'dockingstation'

describe DockingStation do
  it "Expects Docking Station instances to respond to release_bike" do
    expect(subject).to respond_to('release_bike') 
  end

  let(:bike) { double :bike }
  it ".release_bike to release working bike" do
    bike = double(:usable => true)
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike.usable).to eq true
  end
  
  it "raises an error when all bikes are broken" do
    bike = double(:usable => false)
    subject.dock(bike)
    expect{subject.release_bike}.to raise_error "Sorry, all bikes are broken"
  end
  
  it "release a bike when other broken bikes are docked" do
    allow(bike).to receive(:usable).and_return(false, true)
    bike_1 = bike
    subject.dock(bike_1)
    bike_2 = bike 
    subject.dock(bike_2)
    expect(subject.release_bike).to_not eq nil #improve next time to match the double
  end
  
  it ".dock method adds a bike to docking station" do
    bike = double(:usable => false)
    expect(subject.dock(bike)).to include(bike)
  end
  
  it ".dock method adds a bike to docking station even if broken" do
    allow(bike).to receive(:usable).and_return(false)
    expect(subject.dock(bike)).to include(bike)
  end

  it "Raises an error if there are no bikes" do
    subject.bikes = []
    expect { subject.release_bike }.to raise_error "Sorry, there are no bikes"
  end

  it 'Raises an error if when docking at the docking station there is no more capacity' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock((double(:bike)))}
    expect{ subject.dock((double(:bike))) }.to raise_error "Docking station full"
  end

  describe 'changing the capacity on init'do
    subject { DockingStation.new(capacity)}
    let(:capacity) { 10 }

    it 'changes the capacity to 10 on init' do
      10.times{subject.dock((double(:bike)))}
      expect{subject.dock((double(:bike)))}.to raise_error "Docking station full"
    end


  end


end