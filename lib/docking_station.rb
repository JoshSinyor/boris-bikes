require_relative "bike"

class DockingStation


  def initialize
    @bike = nil
  end

  def release_bike
    raise Exception.new
  end

  def dock(bike)
    if @bike.nil?
      @bike = bike
    else
      raise Exception.new
    end
  end

  attr_reader :bike

end
