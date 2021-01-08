class Bike

  DEFAULT_STATUS = true

  def initialize(status = DEFAULT_STATUS)
    @status = status
  end

  def working?
    true
  end

end
