require_relative "bike"

class DockingStation

  attr_reader :bike

  def initialize
    @bike = nil
  end

  def release_bike
    raise Exception.new("No bike in station to release.") if @bike.nil?
    return @bike
  end

  def dock(bike)
    raise Exception.new("Docking station is full.") unless @bike.nil?
    @bike = bike
  end

end
