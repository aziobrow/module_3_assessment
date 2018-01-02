require 'rails_helper'

describe "Items API" do
  before do
    create_list(:item, 3)
  end

  let(:item1) { Item.first }
  let(:item2) { Item.second }
  let(:item3) { Item.last }

  it "sends a list of items" do
    get "/api/v1/items"
    items = JSON.parse(response.body, symbolize_names: true)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
    expect(item).to have_key(:created_at)
    expect(item).to have_key(:updated_at)
  end

  it "sends a single item by id" do
    get "/api/v1/items/#{item1.id}"
    item_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(item_info[:id]).to eq(item1.id)
    expect(item_info).to_not have_value(item2.id)
    expect(item_info).to_not have_value(item3.id)
  end

  it "deletes a single item" do
    delete "/api/v1/items/#{item1.id}"

    expect(response.status).to eq(204)
    response = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
