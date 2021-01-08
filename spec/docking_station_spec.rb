require 'docking_station'

describe DockingStation do

  it "should dock a bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it "should not release a bike if no bike has ever been docked" do
    expect {subject.release_bike}.to raise_error{"No bike has ever been docked, so none can be released."}
  end

  it "should not release a bike if a bike has been docked but then released" do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike

    expect {subject.release_bike}.to raise_error{"Can still release a bike even though none is docked."}
  end

  it "should not dock a bike if no space is available" do
    expect { 21.times { subject.dock(Bike.new) } }.to raise_error{"No space available in docking station to dock bike."}
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

=begin
  it "should, if a capacity is specified, have the specified capacity" do
    station = DockingStation.new(10)
    expect(station.capacity).to eq 10
  end
=end

end
