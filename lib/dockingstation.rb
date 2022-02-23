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
    @bikes.push(bike)
  end

end