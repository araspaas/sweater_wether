class BackgroundImage
  attr_reader :image,
              :credit

  def initialize(image, credit)
    @image = image
    @credit = credit
  end
end
