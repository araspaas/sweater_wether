class Destination
  attr_reader :city,
              :travel_time

  def initialize(data, destination)
    @city = destination
    @travel_time = Time.at(data[:route][:realTime]).utc.strftime('%H hours %M minutes')
  end
end
