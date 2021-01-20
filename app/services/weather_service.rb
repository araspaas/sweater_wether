class WeatherService

  def self.fetch_data(coordinates)
  response = conn.get("data/2.5/onecall") do |req|
    req.params[:lat] = coordinates[0]
    req.params[:lon] = coordinates[1]
    req.params[:exclude] = "minutely"
    req.params[:units] = "imperial"
    req.params[:appid] = ENV["OPEN_WEATHER_API_KEY"]
   end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://api.openweathermap.org/")
  end
end
