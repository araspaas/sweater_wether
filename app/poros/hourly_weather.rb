class HourlyWeather
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:hourly][0][:dt]).in_time_zone
    @temperature = data[:hourly][0][:temp]
    @wind_speed = data[:hourly][0][:wind_speed]
    @wind_direction = wind_degree(data[:hourly][0][:wind_deg])
    @conditions = data[:hourly][0][:weather][0][:description]
    @icon = data[:hourly][0][:weather][0][:icon]
  end


  def wind_degree(number)
    value = ((number / 22.5) + 0.5).to_i
    array = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW]
    array[(value % 17)]
  end
end
