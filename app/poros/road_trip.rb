class RoadTrip
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(origin, destination, travel_time, arrival_forecast)
    @origin = origin
    @destination = destination
    @travel_time = travel_time
    @arrival_forecast = arrival_forecast
  end
end
