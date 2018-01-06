class BestBuyService

attr_reader :conn, :filter

  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end


  def find_stores
    response = conn.get do |req|
      req.url "v1/stores(area(#{filter[:zipcode]},#{filter[:range]}))"
      req.params["apiKey"] = ENV['API_KEY']
      req.params["format"] = "json"
      req.params["pageSize"] = 100
      req.params["show"] = "storeType,name,city,distance,phone"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
