class RoadTripFacade

  def self.fetch_data(origin, destination)
    road_trip_data = LocationService.fetch_road_trip_data(origin, destination)
    latitude_longitude = LocationService.fetch_data(destination)
    weather_data = WeatherService.fetch_data(latitude_longitude)[:hourly]
    travel_time_in_seconds = travel_time_in_seconds(road_trip_data)
    arrival_forecast = arrival_forecast(travel_time_in_seconds, weather_data)
    travel_time = converted_time(road_trip_data)
    RoadTrip.new(origin, destination, travel_time, arrival_forecast)
  end

  def self.arrival_forecast(travel_time_in_seconds, weather_data)
   arrival_time = travel_time_in_seconds[0] + DateTime.now.to_i
   # forecast_data.where(dt: arrival_time)
   weather = weather_data.find { |forecast| forecast[:dt] >= arrival_time }
   ArrivalWeather.new(weather)
 end

 def self.converted_time(data) #hours and minutes
    if data[:route][:realTime].nil? || data[:route][:realTime] == 0
      'Impossible route'
    else
      Time.at(data[:route][:realTime]).utc.strftime('%H hours %M minutes')
    end
  end


  def self.travel_time_in_seconds(data)
    if !data[:route][:legs].nil?
      (data[:route][:legs][0][:time])
    else
      0
    end
  end
end
