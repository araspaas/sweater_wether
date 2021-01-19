class YelpSerializer
  include FastJsonapi::ObjectSerializer
  set_id :fake_id
  attributes :destination_city, :travel_time, :forecast, :restaraunt
end
