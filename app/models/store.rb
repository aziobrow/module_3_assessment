class Store

  attr_reader :name, :city, :distance, :phone, :store_type
  def initialize(raw_store_info)
    @name = raw_station_info[:name]
    @city = raw_station_info[:city]
    @distance = raw_station_info[:distance]
    @phone = raw_station_info[:phone]
    @store_type = raw_station_info[:storeType]
  end




end
