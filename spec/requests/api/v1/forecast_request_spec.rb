require 'rails_helper'

describe 'Forecast API' do
  it 'returns a detailed forecast when given a city and state', :vcr do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('forecast')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a Hash
    expect(json[:data][:attributes]).to have_key(:current_weather)
    expect(json[:data][:attributes][:current_weather]).to be_a Hash
    expect(json[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(json[:data][:attributes][:current_weather][:datetime]).to be_a String
    expect(json[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(json[:data][:attributes][:current_weather][:sunrise]).to be_a String
    expect(json[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(json[:data][:attributes][:current_weather][:sunset]).to be_a String
    expect(json[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(json[:data][:attributes][:current_weather][:temperature]).to be_a Float
    expect(json[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(json[:data][:attributes][:current_weather][:feels_like]).to be_a Float
    expect(json[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(json[:data][:attributes][:current_weather][:humidity]).to be_a(Integer).or be_a(Float)
    expect(json[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(json[:data][:attributes][:current_weather][:uvi]).to be_a(Integer).or be_a(Float)
    expect(json[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(json[:data][:attributes][:current_weather][:visibility]).to be_a(Integer).or be_a(Float)
    expect(json[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(json[:data][:attributes][:current_weather][:conditions]).to be_a String
    expect(json[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(json[:data][:attributes][:current_weather][:icon]).to be_a String
    expect(json[:data][:attributes]).to have_key(:daily_weather)
    expect(json[:data][:attributes][:daily_weather]).to be_a Hash
    expect(json[:data][:attributes][:daily_weather]).to have_key(:date)
    expect(json[:data][:attributes][:daily_weather][:date]).to be_a String
    expect(json[:data][:attributes][:daily_weather]).to have_key(:sunset)
    expect(json[:data][:attributes][:daily_weather][:sunset]).to be_a String
    expect(json[:data][:attributes][:daily_weather]).to have_key(:sunrise)
    expect(json[:data][:attributes][:daily_weather][:sunrise]).to be_a String
    expect(json[:data][:attributes][:daily_weather]).to have_key(:max_temp)
    expect(json[:data][:attributes][:daily_weather][:max_temp]).to be_a Float
    expect(json[:data][:attributes][:daily_weather]).to have_key(:min_temp)
    expect(json[:data][:attributes][:daily_weather][:min_temp]).to be_a Float
    expect(json[:data][:attributes][:daily_weather]).to have_key(:conditions)
    expect(json[:data][:attributes][:daily_weather][:conditions]).to be_a String
    expect(json[:data][:attributes][:daily_weather]).to have_key(:icon)
    expect(json[:data][:attributes][:daily_weather][:icon]).to be_a String
    expect(json[:data][:attributes]).to have_key(:hourly_weather)
    expect(json[:data][:attributes][:hourly_weather]).to be_a Hash
    expect(json[:data][:attributes][:hourly_weather]).to have_key(:time)
    expect(json[:data][:attributes][:hourly_weather][:time]).to be_a Integer
    expect(json[:data][:attributes][:hourly_weather]).to have_key(:temperature)
    expect(json[:data][:attributes][:hourly_weather][:temperature]).to be_a Float
    expect(json[:data][:attributes][:hourly_weather]).to have_key(:wind_speed)
    expect(json[:data][:attributes][:hourly_weather][:wind_speed]).to be_a Float
    expect(json[:data][:attributes][:hourly_weather]).to have_key(:wind_direction)
    expect(json[:data][:attributes][:hourly_weather][:wind_direction]).to be_a String
    expect(json[:data][:attributes][:hourly_weather]).to have_key(:conditions)
    expect(json[:data][:attributes][:hourly_weather][:conditions]).to be_a String
    expect(json[:data][:attributes][:hourly_weather]).to have_key(:icon)
    expect(json[:data][:attributes][:hourly_weather][:icon]).to be_a String
  end
end
