require 'rails_helper'

describe "store presenter returns stores" do
  before do
    @presenter = StorePresenter.new("80202")
    @stores = @presenter.stores
    @store = @stores.first
  end

  it "creates filter with zipcode and range" do
    expect(@presenter.filter).to have_key(:zipcode)
    expect(@presenter.filter).to have_key(:range)
    expect(@presenter.filter).to have_value("80202")
    expect(@presenter.filter).to have_value("25")
  end

  it "creates stores from raw info from service" do
    expect(@stores).to be_a Array
    expect(@stores.count).to eq(17)
    expect(@stores.first).to be_a Store
  end

  it "creates stores with correct attributes" do
    expect(@store.name).to eq("CHERRY CREEK MALL")
    expect(@store.city).to eq("Denver")
    expect(@store.distance).to eq(3.45)
    expect(@store.phone).to eq("303-270-9189")
    expect(@store.store_type).to eq("Mobile SAS")
  end
end
