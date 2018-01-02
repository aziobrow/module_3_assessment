class Store

  attr_reader :name, :city, :distance, :phone, :store_type
  def initialize(raw_store_info)
    @name = raw_store_info[:name]
    @city = raw_store_info[:city]
    @distance = raw_store_info[:distance]
    @phone = raw_store_info[:phone]
    @store_type = raw_store_info[:storeType]
  end

  def self.nearest_stores(zipcode)
    all_stores_raw_info = BestBuyService.new(zipcode).get_store_info
    require "pry"; binding.pry
    all_stores_raw_info.map do |one_store_info|
      new(one_store_info)
    end
  end

end
