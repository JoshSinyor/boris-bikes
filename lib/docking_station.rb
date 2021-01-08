require_relative "bike"

class DockingStation

  attr_reader :bikes_docked

  def initialize
    @bikes_docked = []
  end

  def release_bike
    raise Exception.new("No bike in station to release.") if empty?
    @bikes_docked.pop
  end

  def dock(bike)
    raise Exception.new("Docking station is full.") if full?
    @bikes_docked << bike
  end

  private

  def empty?
    @bikes_docked.count <= 0
  end

  def full?
    @bikes_docked.count >= 20
  end

end
