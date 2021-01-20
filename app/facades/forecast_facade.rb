class ForecastFacade

  def self.fetch_data(location)
    latitude_longitude = LocationService.fetch_data(location)
    weather_data = WeatherService.fetch_data(latitude_longitude)
    current_weather = CurrentWeather.new(weather_data)
    daily_weather = DailyWeather.new(weather_data)
    hourly_weather = HourlyWeather.new(weather_data)
    Forecast.new(current_weather, daily_weather, hourly_weather)
  end
end
