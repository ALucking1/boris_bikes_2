require 'docking_station'

describe DockingStation do
  docking_station = DockingStation.new
  it 'releases bike' do
    expect(docking_station).to respond_to(:release_bike)
  end
  it 'is working?' do
    boris = Bike.new
    expect(boris.working?).to eq true
  end
  it 'docks a bike' do
    expect(docking_station).to respond_to(:dock).with(1).argument
  end

  it 'reads attr_reader' do
    expect(docking_station).to respond_to(:bikes)
  end

  describe '#dock' do
    DEFAULT_CAPACITY = 20
    DEFAULT_CAPACITY.times { docking_station.dock Bike.new }
    it 'raises an error when station is at capacity' do
      expect {docking_station.dock(Bike.new)}.to raise_error 'Station is at capacity'
    end
  end

end
describe '#release_bike' do
  docking_station = DockingStation.new
  it 'raises an error when no bikes available' do
    expect {docking_station.release_bike}.to raise_error 'No bike available'
  end
end
describe 'user-given capacity' do
  docking_station = DockingStation.new(34)
  it "varies capacity" do
    expect(docking_station.capacity).to eq 34
  end
end
describe 'default capacity' do
  docking_station = DockingStation.new
  it "gives default capacity" do
    expect(docking_station.capacity).to eq DEFAULT_CAPACITY
  end
end
# describe '' do
#   it '' do
#     expect rgsggs.to eq (:capacity)
#   end
# end
