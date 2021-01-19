require 'rails_helper'

describe 'Yelp Fusion API' do
  it 'returns', :vcr do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'

    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:attributes][:destination_city]).to be_a(Hash)
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(json[:data][:attributes][:forecast][:temperature]).to be_a(String)
    expect(json[:data][:attributes][:restaraunt]).to be_a(Hash)
    expect(json[:data][:attributes][:restaraunt][:name]).to be_a(String)
    expect(json[:data][:attributes][:restaraunt][:address]).to be_a(String)
    expect(json[:data][:id]).to eq(nil)
  end
end
