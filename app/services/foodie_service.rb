class FoodieService

  def self.fetch_data(start, destination, search)
    response = conn.get("api/v2.1/search") do |req|
      req.headers['user-key'] = ENV["ZAMOTO_API_KEY"]
      req.params[:search] = search
      req.params[:start] = start
      req.params[:end] = destination
    end
    x = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://developers.zomato.com/")
  end
end
