require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  attr_accessor :bikes 
  
  def release_bike
    if @bikes == []
      raise "Sorry, there are no bikes"
    else
      Bike.new
    end
  end

  def dock(bike)
    if @bikes.length == 20
      fail "Docking station full"
    else
    @bikes.push(bike)
    end
  end

end