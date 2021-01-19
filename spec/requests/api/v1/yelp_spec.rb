require 'rails_helper'

describe 'Yelp Fusion API' do
  it 'returns', :vcr do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:attributes][:current][:weather]).to be_a(Array)
    expect(json[:data][:attributes][:hourly]).to be_a(Array)
    expect(json[:data][:attributes][:daily]).to be_a(Array)
    expect(json[:data][:attributes][:daily].length).to eq(8)
    expect(json[:data][:id]).to eq(nil)
  end
end
