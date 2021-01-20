class FoodieService

  def self.fetch_data(latitude_longitude, search)
    response = conn.get("api/v2.1/search") do |req|
      req.headers['user-key'] = ENV["ZAMOTO_API_KEY"]
      req.params[:q] = search
      req.params[:lat] = latitude_longitude[0]
      req.params[:lon] = latitude_longitude[1]
      req.params[:count] = 1
    end
    x = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://developers.zomato.com/")
  end
end
