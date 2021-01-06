require_relative "bike"

class DockingStation

  attr_reader = stored_bikes

  @stored_bikes = []

  def release_bike
    bike = Bike.new
  end

  def dock_bike(bike)
    @stored_bikes.push(bike)
  end

end
