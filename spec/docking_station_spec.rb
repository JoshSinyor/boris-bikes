require 'docking_station'

describe DockingStation do

  it "should dock a bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it "should not release a bike if no bike has ever been docked" do
    expect {subject.release_bike}.to raise_error{"No bike has ever been docked, so none can be released."}
  end

=begin
  it "should not release a bike if a bike has been docked but then released" do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike

    expect {subject.release_bike}.to raise_error{"Can still release a bike even though none is docked."}
  end
=end

  it "should not dock a bike if no space is available" do
    bike = Bike.new
    subject.dock(bike)

    bike = Bike.new
    expect { subject.dock(bike) }.to raise_error{"No space available in docking station to dock bike."}
  end


  it "should release a working bike" do
    bike = Bike.new
    subject.dock(bike)

    bike = subject.release_bike
    expect(bike.working?).to eq true
  end

end
