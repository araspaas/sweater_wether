class FoodieFacade

  def self.fetch_data(start, destination, search)
    latitude_longitude = LocationService.fetch_data(destination)
    restaurant_data = FoodieService.fetch_data(latitude_longitude, search)
    restaurant = Restaurant.new(restaurant_data)
    travel_data = LocationService.fetch_road_trip_data(start, destination)
    destination = Destination.new(travel_data, destination)
    weather_data = WeatherService.fetch_data(latitude_longitude)
    destination_forecast = DestinationForecast.new(weather_data[:hourly])
    Foodie.new(restaurant, destination, destination_forecast)
  end
end
