require_relative "bike"

class DockingStation


  def initialize
    @bike = nil
  end

  def release_bike
    "Bike released."
    raise Exception.new
  end

  def dock(bike)
    if @bike.nil?
      @bike = bike
      puts "Bike docked."
    else
      puts "No space available in dock."
      raise Exception.new
    end
  end

  attr_reader :bike

end
