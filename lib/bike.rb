class Bike

  DEFAULT_STATUS = true

  def initialize(status = DEFAULT_STATUS)
    @status = status
  end

  def working?
    if @status = true
      true
    else
      false
    end
  end

end
