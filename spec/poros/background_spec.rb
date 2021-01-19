require 'rails_helper'

describe Background, :vcr do
  it "exists" do
    bg = Background.new("denver,co")
    expect(bg).to be_a(Background)
    expect(bg.image_url).to be_a(Array)
  end
end
