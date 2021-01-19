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

  end

  def destination_city
    destination = json ||= LocationService.new.get_location(@location)
    json[:results][0][:locations][0][:latLng]
  end

  def travel_time

  end

  def restaraunt

  end
end
