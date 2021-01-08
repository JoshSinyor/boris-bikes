require_relative "bike"

class DockingStation

  attr_reader :bikes_docked

  def initialize
    @bikes_docked = []
  end

  def release_bike
    raise Exception.new("No bike in station to release.") if @bikes_docked.empty?
    @bikes_docked.pop
  end

  def dock(bike)
    raise Exception.new("Docking station is full.") if @bikes_docked.count > 19
    @bikes_docked << bike
  end

end
