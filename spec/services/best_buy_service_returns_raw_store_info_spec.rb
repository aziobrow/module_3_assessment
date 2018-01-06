require 'rails_helper'

describe "service returns raw store info" do
  before do
    service = BestBuyService.new({zipcode: "80202", range: "25"})
    @results = service.find_stores
    @store_result = @results[:stores].first
  end

  it "makes a successful api request" do
    expect(@results).to be_a Hash
    expect(@results).to have_key(:stores)
    expect(@results[:stores].count).to eq(17)
  end

  it "includes relevant details about each store" do
    expect(@store_result).to have_key(:storeType)
    expect(@store_result).to have_key(:name)
    expect(@store_result).to have_key(:city)
    expect(@store_result).to have_key(:distance)
    expect(@store_result).to have_key(:phone)
  end
end
