class Api::V1::YelpController < ApplicationController

  def index
    binding.pry
    destination = Destination.new(params[:start])
    yelp = Yelp.new(destination.location, destination.latitude, destination.longitude)
    render json: YelpSerializer.new(yelp)
  end
end
