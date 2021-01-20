class FoodieFacade

  def self.fetch_data(start, destination, search)
    restaurant_data = FoodieService.fetch_data(start, destination, search)
    restaurant = Restaurant.new(restaurant_data)
    travel_data = LocationService.fetch_road_trip_data(start, destination)
    destination = Destination.new(travel_data, destination)
    latitude_longitude = LocationService.fetch_data(destination)
    binding.pry
  end
end
