class Bike
  
  attr_reader :usable
  
  def initialize
  @usable = true
  end

  def broken
    @usable = false
  end

end