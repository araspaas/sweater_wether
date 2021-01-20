class FoodieFacade

  def self.fetch_data(start, destination, search)
    restaurant_data = FoodieService.fetch_data(start, destination, search)
    restaurant = Restaurant.new(restaurant_data)
    binding.pry
  end
end
