class LocationService

  def self.fetch_data(location)
    response = conn.get("geocoding/v1/address") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:location] = location
      req.params[:inFormat] = 'kvp'
      req.params[:outFormat] = 'json'
      req.params[:thumbMaps] = 'false'
    end
    json = JSON.parse(response.body, symbolize_names: true)
     x = [(json[:results][0][:locations][0][:latLng][:lat]).to_f, (json[:results][0][:locations][0][:latLng][:lng]).to_f]
  end

  def self.conn
    Faraday.new("http://www.mapquestapi.com/")
  end
end
