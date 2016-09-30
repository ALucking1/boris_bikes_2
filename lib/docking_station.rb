require_relative 'bike'

class DockingStation
attr_reader :bikes
DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bike available' if dock_empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Station is at capacity' if dock_full?
    @bikes << bike
  end


  private

  def dock_full?
    return true if @bikes.length >= DEFAULT_CAPACITY
  end

  def dock_empty?
    return true if @bikes.empty?
  end

end
