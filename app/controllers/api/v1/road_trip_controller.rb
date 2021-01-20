class Api::V1::RoadTripController < ApplicationController
  def create
    render json: RoadTripSerializer.new(RoadTripFacade.fetch_data(params[:origin], params[:destination]))
  end
end
