require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  attr_accessor :bikes 
  
  def release_bike
    if empty?
      raise "Sorry, there are no bikes"
    else
      @bikes.each_with_index { |bike,index|
      if bike.usable
        return @bikes.delete_at(index)
      end 
    }
    raise "Sorry, all bikes are broken"
    end
  end

  def dock(bike)
    if full?
      fail "Docking station full"
    else
    @bikes.push(bike)
    end
  end

  private
  
  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.empty?
  end

end