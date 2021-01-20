class FoodieSerializer
  include FastJsonapi::ObjectSerializer
  set_id {nil}
  attributes :restaurant, :end_location, :forecast, :travel_time
end
