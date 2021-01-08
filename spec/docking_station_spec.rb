require 'docking_station'

describe DockingStation do

  it "should dock a bike." do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it "should not release a bike if no bike has ever been docked." do
    expect {subject.release_bike}.to raise_error{}
  end

  it "should not release a bike if all bikes docked have since been released." do
    subject.dock(Bike.new)
    subject.release_bike
    expect {subject.release_bike}.to raise_error{}
  end

  it "should not dock a bike if no space is available at default capacity." do
    expect { 21.times { subject.dock(Bike.new) } }.to raise_error{}
  end

  it "should release a working bike." do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike.working).to eq 1
  end

  it "should not release a broken bike." do
    subject.dock(Bike.new("broken"))
    expect { subject.release_bike }.to raise_error{}
  end

  it "should, unless a capacity is specified, have a default capacity." do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


  it "should, if a capacity is specified, have the specified capacity." do
    station = DockingStation.new(10)
    10.times { station.dock(Bike.new) }
    expect { station.dock(Bike.new) }.to raise_error{}
  end

end
