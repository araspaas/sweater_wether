require 'rails_helper'

describe 'Zamoto API' do
  it 'returns appropriate data', :vcr do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry

  end
end
