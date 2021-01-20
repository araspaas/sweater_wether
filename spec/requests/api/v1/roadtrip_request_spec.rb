require 'rails_helper'

describe 'Roadtrip request' do
  it 'can get correct json from a request', :vcr do
    request = {
      "origin": 'Denver,co',
      "destination": 'Pueblo,co',
      "api_key": 
    }
  end
end
