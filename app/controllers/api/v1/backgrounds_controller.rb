class Api::V1::BackgroundsController < ApplicationController
  def index
    destination = Destination.new(params[:location])
    background = Background.new(destination.location)
    render json: BackgroundSerializer.new(background)
  end
end
