require 'rails_helper'

describe 'forecast facade' do
  it 'returns a forcast', :vcr do
    location = 'rockford, il'
    forecast = ForecastFacade.fetch_data(location)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.daily_weather).to be_a(DailyWeather)
    expect(forecast.hourly_weather).to be_a(HourlyWeather)
  end
end
