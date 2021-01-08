require 'docking_station'

describe DockingStation do

  # it "should not release a bike if no bike is available" do
  # expect {subject.release_bike}.to raise_exception
  # puts "No bikes docked."
  # end

  it "should not dock a bike if no space is available" do
  bike = Bike.new
  subject.dock(bike)

  bike = Bike.new
  expect { subject.dock(bike) }.to raise_exception
  end


  # it "should release a working bike" do
  #   bike = subject.release_bike
  #   expect(bike.working?).to eq true
  # end

  #it "should dock a bike" do
  #  bike = Bike.new
  #  expect(subject.dock(bike)).to eq bike
  #end

end
