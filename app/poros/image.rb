class Image
  attr_reader :location,
              :image_url

  def initialize(data, location)
    @location = location
    @image_url = data[:results][0][:urls][:small]
  end
end
