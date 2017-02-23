require 'rails_helper'

describe "Items API" do
  it "INDEX: gets all items" do
    item_1 = Item.create!(name: "dingus", description: "some cheap crap")
    item_2 = Item.create!(name: "pogo stick", description: "only the finest")

    get "/api/v1/items"

    items = JSON.parse(response.body)

    expect(response.status).to eq(200)

    expect(items.count).to eq(2)
  end

  it "SHOW: gets one item by item id" do
    item_1 = Item.create!(name: "dingus", description: "some cheap crap")
    item_2 = Item.create!(name: "pogo stick", description: "only the finest")

    get "/api/v1/items/#{item_1.id}"

    item = JSON.parse(response.body)

    expect(response.status).to eq(200)

    byebug
    expect(item.count).to eq(1)
    expect(item.id).to eq(item_1.id)
    expect(item.name).to eq(item_1.name)
    expect(item.description).to eq(item_1.description)
    expect(item.image_url).to eq(nil)

    # expect(item.created_at).to eq(item_1.description)
    # expect(item.updated_at).to eq(nil)
  end


end
