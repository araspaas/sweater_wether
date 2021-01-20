require 'rails_helper'

describe HourlyWeather do
  before :each do
    @data = {
      :hourly => [{
        dt: 1_610_910_000,
        temp: 47.21,
        wind_speed: 1.72,
        wind_deg: 173,
        weather: [{ description: 'windy', icon: '04g' }]
        }]
    }
  end
  it 'exists' do
    weather = HourlyWeather.new(@data)
    expect(weather).to be_a(HourlyWeather)
    expect(weather.time).to eq(' 2021-01-17 12:00:00 -0700')
    expect(weather.temperature).to eq(47.21)
    expect(weather.wind_speed).to eq(1.72)
    expect(weather.wind_direction).to eq('S')
    expect(weather.conditions).to eq('windy')
    expect(weather.icon).to eq('04g')
  end

  it '.wind_degree' do
    weather = HourlyWeather.new(@data)
    expect(weather.wind_degree(11)).to eq('N')
    expect(weather.wind_degree(33)).to eq('NNE')
    expect(weather.wind_degree(56)).to eq('NE')
    expect(weather.wind_degree(78)).to eq('ENE')
    expect(weather.wind_degree(101)).to eq('E')
    expect(weather.wind_degree(123)).to eq('ESE')
    expect(weather.wind_degree(146)).to eq('SE')
    expect(weather.wind_degree(168)).to eq('SSE')
    expect(weather.wind_degree(191)).to eq('S')
    expect(weather.wind_degree(213)).to eq('SSW')
    expect(weather.wind_degree(236)).to eq('SW')
    expect(weather.wind_degree(258)).to eq('WSW')
    expect(weather.wind_degree(281)).to eq('W')
    expect(weather.wind_degree(303)).to eq('WNW')
    expect(weather.wind_degree(326)).to eq('NW')
    expect(weather.wind_degree(348)).to eq('NNW')
  end
end
