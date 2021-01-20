require 'rails_helper'

describe "Foodie Service" do
  xit "can get restaurant data", :vcr do
    search = 'mexican'
    lat_lon = [42.259445, -89.064445]
    foodie_data = FoodieService.fetch_data(search, lat_lon)
    binding.pry
  end
end
