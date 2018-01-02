class BestBuyService

attr_reader :conn, :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_store_info
    get_json("/v1/stores(postalCode=#{zipcode})?format=json&show=storeType,name,city,phone,distance&apiKey=#{ENV['API_KEY']}")
  end

  private
  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end


end
