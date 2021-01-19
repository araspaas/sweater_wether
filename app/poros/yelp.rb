class Yelp
  attr_reader :location,
              :forecast,
              :fake_id,
              :start_city,
              :destination_city


  def initialize(location, latitude, longitude)
    @location = location
    @latitude = latitude
    @longitude = longitude
    @forecast = forecast
    @fake_id = nil
    @start = start_city
    @destination = destination_city
  end

  def forecast
    current = WeatherService.new.get_forecast(@latitude, @longitude)
    { summary: current[:current][:weather][0][:description], temperature: current[:current][:temp] }
  end

  def start_city
    #code goes here
  end

  def destination_city
    json ||= LocationService.new.get_location(@location)
    json[:results][0][:locations][0][:latLng]
  end

  def travel_time
    binding.pry
  end

  def restaraunt
    #code goes here
  end
end
