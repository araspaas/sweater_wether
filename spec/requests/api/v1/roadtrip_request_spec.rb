require 'rails_helper'

describe 'Roadtrip request' do
  it 'can get correct json from a request', :vcr do
    request = {
      "origin": 'Denver,co',
      "destination": 'Rockford,il'
    }

    headers = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(request)
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:data)
    expect(json[:data]).to be_a Hash
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('road_trip')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a Hash
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes][:origin]).to be_a String
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes][:destination]).to be_a String
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_a String
    expect(json[:data][:attributes]).to have_key(:arrival_forecast)
    expect(json[:data][:attributes][:arrival_forecast]).to be_a Hash
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:arrival_forecast][:temperature]).to be_a(Integer).or be_a(Float)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:conditions)
    expect(json[:data][:attributes][:arrival_forecast][:conditions]).to be_a String
  end
end
