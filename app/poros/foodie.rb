class Foodie
  attr_reader :end_location,
              :restaurant,
              :forecast,
              :travel_time

  def initialize(restaurant, destination, hourly_weather)
    @restaurant = restaurant
    @end_location = destination.city
    @forecast = hourly_weather
    @travel_time = destination.travel_time
  end
end
