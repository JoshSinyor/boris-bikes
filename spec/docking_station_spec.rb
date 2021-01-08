require 'docking_station'

describe DockingStation do

  it "should dock a bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it "should not release a bike if no bike has ever been docked" do
    expect {subject.release_bike}.to raise_error{"Docking station can release a bike even though none have ever been docked."}
  end

  it "should not release a bike if all bikes docked have since been released" do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike

    expect {subject.release_bike}.to raise_error{"Docking station can release a bike even though all those docked have been released."}
  end

  it "should not dock a bike if no space is available at default capacity" do
    expect { 21.times { subject.dock(Bike.new) } }.to raise_error{"Docking station at default capacity is full."}
  end

  it "should release a working bike" do
    bike = Bike.new
    subject.dock(bike)

    bike = subject.release_bike
    expect(bike.working?).to eq true
  end

  it "should, unless a capacity is specified, have a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


  it "should, if a capacity is specified, have the specified capacity" do
    station = DockingStation.new(10)
    10.times { station.dock(Bike.new) }
    expect { station.dock(Bike.new) }.to raise_error{"Docking station at specified capacity is full."}
  end

end
