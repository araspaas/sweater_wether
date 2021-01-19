class YelpService


  def get_restaraunt(food_type, destination)
    response = conn.get("data/get-trails") do |req|
      req.header[:key] = ENV["YELP_API_ID"]
      req.params[:term] = food_type
      req.params[:location] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.yelp.com/")
  end
end
