class DestinationForecast
  attr_reader :summary,
              :temperature

  def initialize(data)
    @summary = data[0][:temp]
    @temperature = data[0][:weather][0][:description]
  end
end
