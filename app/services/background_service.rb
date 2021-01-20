class BackgroundService

  def self.fetch_data(destination)
    response = conn.get("search/photos") do |req|
      req.params[:query] = "#{destination} AND landscape"
      req.params[:orientation] = "landscape"
      req.params[:per_page] = 1
      req.params[:client_id] = ENV["UNSPLASH_CLIENT_ID"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://api.unsplash.com/")
  end
end
