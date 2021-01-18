class Api::V1::ForecastController < ApplicationController
  def index
    destination = Destination.new(params[:location])
    forecast = Forecast.new(destination.location, destination.latitude, destination.longitude)
    render json: ForecastSerializer.new(forecast)
  end
end
