class Store

  attr_reader :name, :city, :distance, :phone, :store_type
  def initialize(raw_store_info)
    @name = raw_store_info[:name]
    @city = raw_store_info[:city]
    @distance = raw_store_info[:distance]
    @phone = raw_store_info[:phone]
    @store_type = raw_store_info[:storeType]
  end

end
