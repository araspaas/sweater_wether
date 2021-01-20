class Background
  attr_reader :location,
              :image_url

  def initialize(location)
    @location = location
    @image_url = [destination_image[:results][0][:urls][:full]]
  end

  def destination_image
    BackgroundService.new.get_background(@location)
  end
end
