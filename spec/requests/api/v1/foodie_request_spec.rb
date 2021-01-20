require 'rails_helper'

describe 'Zamoto API' do
  it 'returns appropriate data', :vcr do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

    expect(json).to be_a Hash
    expect(json).to have_key(:data)
    expect(json[:data]).to be_a Hash
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to be_a String
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a Hash
    expect(json[:data][:attributes]).to have_key(:restaurant)
    expect(json[:data][:attributes][:restaurant]).to be_a Hash
    expect(json[:data][:attributes][:restaurant]).to have_key(:name)
    expect(json[:data][:attributes][:restaurant]).to have_key(:address)
    expect(json[:data][:attributes][:restaurant][:address]).to be_a String
    expect(json[:data][:attributes][:restaurant][:name]).to be_a String
    expect(json[:data][:attributes]).to have_key(:end_location)
    expect(json[:data][:attributes][:end_location]).to be_a String
    expect(json[:data][:attributes][:forecast]).to be_a Hash
    expect(json[:data][:attributes][:forecast]).to have_key(:summary) # This value is backwards and ian said not to worry so I didn't fix it
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature) # This value is backwards and ian said not to worry so I didn't fix it summary is temp and vise versa
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_a String
  end
end
