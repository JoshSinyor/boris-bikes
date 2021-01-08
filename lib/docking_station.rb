require_relative "bike"

class DockingStation

  # attr_reader :bikes_docked
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes_docked = []
  end

  def release_bike
    raise Exception.new("No bike in station to release.") if empty?
    @bikes_docked = @bikes_docked.sort_by! { |bike| bike.working? }
    raise Exception.new("No working bikes in station to release.") if !@bikes_docked[-1].working?
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
    @bikes_docked.count >= @capacity
  end

end
