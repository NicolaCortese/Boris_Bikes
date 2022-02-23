require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  attr_reader :bikes 
  
  def release_bike
    Bike.new
  end

  def dock(bike)
    @bikes.push(bike)
  end

end