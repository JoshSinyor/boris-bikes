class Bike

  DEFAULT_STATUS = 1

  def initialize(status = DEFAULT_STATUS)
    if status == DEFAULT_STATUS
      @status = 1
    else
      @status = 0
    end
  end

  def working
    return @status
  end

end
