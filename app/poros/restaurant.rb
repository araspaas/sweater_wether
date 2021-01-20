class Restaurant
  attr_reader :name,
              :address,
              :latitude,
              :longitude

  def initialize(data)
    @name = data[:restaurants][0][:restaurant][:name]
    @address = data[:restaurants][0][:restaurant][:location][:address]
    @latitude = data[:restaurants][0][:restaurant][:location][:latitude] # not sure if i need this here
    @longitude = data[:restaurants][0][:restaurant][:location][:longitude] # not sure if i need this here
  end
end
