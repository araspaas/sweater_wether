require 'rails_helper'

describe BackgroundImage, :vcr do
  xit "exists" do


    bg = BackgroundImage.new(image, credit)
    expect(bg).to be_a(Background)
    expect(bg.image).to be_a(Image)
    expect(bg.credit).to be_a(Credit)
  end
end
