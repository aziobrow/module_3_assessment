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

    get "/api/v1/items"
    item_info = JSON.parse(response.body, symbolize_names: true)

    expect(item_info.first).to_not have_key(item1.id)
  end

  it "creates a single item" do
    post "/api/v1/items?name=NewItem&description=newdeaddoves&image_url=http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"

    expect(response).to be_success

    get "/api/v1/items"
    item_info = JSON.parse(response.body, symbolize_names: true)
    new_item = item_info.last

    expect(item_info.count).to eq(4)
    expect(new_item).to have_key(:id)
    expect(new_item).to have_key(:name)
    expect(new_item).to have_key(:description)
    expect(new_item).to have_key(:image_url)
    expect(new_item).to_not have_key(:created_at)
    expect(new_item).to_not have_key(:updated_at)
    expect(new_item).to have_value('NewItem')
    expect(new_item).to have_value('newdeaddoves')
    expect(new_item).to have_value('http://robohash.org/1.png?set=set2')
  end
end
