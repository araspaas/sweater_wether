class BackgroundFacade

  def self.fetch_data(location)
    background_image_data = BackgroundService.fetch_data(location)
    image = Image.new(background_image_data, location)
    credit = Credit.new(background_image_data)
    BackgroundImage.new(image, credit)
  end
end
