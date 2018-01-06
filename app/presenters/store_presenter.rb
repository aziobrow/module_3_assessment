class StorePresenter

  attr_reader :filter

  def initialize(params_zipcode)
    @filter = {zipcode: params_zipcode, range: "25"}
  end

  def stores
    service.find_stores[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  private
      def service
        BestBuyService.new(filter)
      end
end
