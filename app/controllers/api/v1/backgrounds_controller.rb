class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: BackgroundImageSerializer.new(BackgroundFacade.fetch_data(params[:location]))
  end
end
