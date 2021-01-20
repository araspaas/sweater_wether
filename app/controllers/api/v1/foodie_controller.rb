class Api::V1::FoodieController < ApplicationController
  def index
    render json: FoodieFacade.fetch_data(params[:start], params[:end], params[:search])
  end
end
