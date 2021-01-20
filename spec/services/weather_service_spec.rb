require 'rails_helper'


describe 'Weather Service' do
  it 'can get weather data from latitude And longitude input', :vcr do

    latitude_longitude = [42.259445, -89.064445]

    weather_data = WeatherService.fetch_data(latitude_longitude)

    expect(weather_data).to be_a Hash
    expect(weather_data).to have_key(:current)
    expect(weather_data[:current]).to be_a Hash

    current = weather_data[:current]

    expect(current).to have_key(:dt)
    expect(current[:dt]).to be_a Integer
    expect(current).to have_key(:sunrise)
    expect(current[:sunrise]).to be_a Integer
    expect(current).to have_key(:sunset)
    expect(current[:sunset]).to be_a Integer
    expect(current).to have_key(:temp)
    expect(current[:temp]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:feels_like)
    expect(current[:feels_like]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:pressure)
    expect(current[:pressure]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:humidity)
    expect(current[:humidity]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:dew_point)
    expect(current[:dew_point]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:uvi)
    expect(current[:uvi]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:clouds)
    expect(current[:clouds]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:visibility)
    expect(current[:visibility]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:wind_speed)
    expect(current[:wind_speed]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:wind_deg)
    expect(current[:wind_deg]).to be_a(Integer).or be_a(Float)
    expect(current).to have_key(:weather)
    expect(current[:weather]).to be_a(Array)
    expect(current[:weather][0]).to have_key(:description)
    expect(current[:weather][0][:description]).to be_a(String)
    expect(current[:weather][0]).to have_key(:icon)
    expect(current[:weather][0][:icon]).to be_a(String)

    expect(weather_data).to have_key(:hourly)
    expect(weather_data[:hourly]).to be_a Array
    hour = weather_data[:hourly][0]
    expect(hour).to have_key(:dt)
    expect(hour[:dt]).to be_a Integer
    expect(hour).to have_key(:temp)
    expect(hour[:temp]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:feels_like)
    expect(hour[:feels_like]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:pressure)
    expect(hour[:pressure]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:humidity)
    expect(hour[:humidity]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:dew_point)
    expect(hour[:dew_point]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:uvi)
    expect(hour[:uvi]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:clouds)
    expect(hour[:clouds]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:visibility)
    expect(hour[:visibility]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:wind_speed)
    expect(hour[:wind_speed]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:wind_deg)
    expect(hour[:wind_deg]).to be_a(Integer).or be_a(Float)
    expect(hour).to have_key(:weather)
    expect(hour[:weather]).to be_a(Array)
    expect(hour[:weather][0]).to have_key(:description)
    expect(hour[:weather][0][:description]).to be_a(String)
    expect(hour[:weather][0]).to have_key(:icon)
    expect(hour[:weather][0][:icon]).to be_a(String)
    expect(hour).to have_key(:pop)
    expect(hour[:pop]).to be_a(Integer).or be_a(Float)

    expect(weather_data).to have_key(:daily)
    expect(weather_data[:daily]).to be_a Array
    day = weather_data[:daily][0]
    expect(day).to have_key(:dt)
    expect(day[:dt]).to be_a Integer
    expect(day).to have_key(:sunrise)
    expect(day[:sunrise]).to be_a Integer
    expect(day).to have_key(:sunset)
    expect(day[:sunset]).to be_a Integer
    expect(day).to have_key(:temp)
    expect(day[:temp]).to be_a(Hash)
    expect(day).to have_key(:feels_like)
    expect(day[:feels_like]).to be_a(Hash)
    expect(day).to have_key(:pressure)
    expect(day[:pressure]).to be_a(Integer).or be_a(Float)
    expect(day).to have_key(:humidity)
    expect(day[:humidity]).to be_a(Integer).or be_a(Float)
    expect(day).to have_key(:dew_point)
    expect(day[:dew_point]).to be_a(Integer).or be_a(Float)
    expect(day).to have_key(:wind_speed)
    expect(day[:wind_speed]).to be_a(Integer).or be_a(Float)
    expect(day).to have_key(:wind_deg)
    expect(day[:wind_deg]).to be_a(Integer).or be_a(Float)
    expect(day).to have_key(:uvi)
    expect(day[:uvi]).to be_a(Integer).or be_a(Float)
    expect(day).to have_key(:clouds)
    expect(day[:clouds]).to be_a(Integer).or be_a(Float)
    expect(day).to have_key(:weather)
    expect(day[:weather]).to be_a(Array)
    expect(day[:weather][0]).to have_key(:description)
    expect(day[:weather][0][:description]).to be_a(String)
    expect(day[:weather][0]).to have_key(:icon)
    expect(day[:weather][0][:icon]).to be_a(String)
    expect(day).to have_key(:pop)
    expect(day[:pop]).to be_a(Integer).or be_a(Float)
  end
end
