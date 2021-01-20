require 'rails_helper'

describe 'Background image facade' do
  it "returns an image", :vcr do
    location = 'rockford, il'
    image = BackgroundFacade.fetch_data(location)

    expect(image).to be_a(BackgroundImage)
  end
end
