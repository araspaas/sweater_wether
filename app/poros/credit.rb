class Credit
  attr_reader :source,
              :author

  def initialize(data)
    @source = "unsplash.com"
    @author = data[:results][0][:user][:links][:html]
  end
end
