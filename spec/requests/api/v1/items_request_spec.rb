require 'rails_helper'

describe "Items API" do
  it "INDEX: gets all items" do
    item_1 = Item.create!(name: "dingus", description: "some cheap crap", image_url: "www.blank.com")
    item_2 = Item.create!(name: "pogo stick", description: "only the finest", image_url: "www.blank.com")

    get "/api/v1/items"

    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
  end

  it "SHOW: gets one item by item id" do
    item_1 = Item.create!(name: "dingus", description: "some cheap crap", image_url: "www.blank.com")
    item_2 = Item.create!(name: "pogo stick", description: "only the finest", image_url: "www.blank.com")

    get "/api/v1/items/#{item_1.id}"

    item = JSON.parse(response.body)

    expect(response.status).to eq(200)

    expect(item["id"]).to eq(item_1.id)
    expect(item["name"]).to eq(item_1.name)
    expect(item["description"]).to eq(item_1.description)
    expect(item["image_url"]).to eq(item_1.image_url)

    # expect(item.created_at).to eq(item_1.description)
    # expect(item.updated_at).to eq(nil)
  end

  it "DELETE: destroys an item's record" do
    item_1 = Item.create!(name: "dingus", description: "some cheap crap", image_url: "www.blank.com")
    item_2 = Item.create!(name: "pogo stick", description: "only the finest", image_url: "www.blank.com")

    delete "/api/v1/items/#{item_1.id}"

    expect(response.status).to eq(204)
    expect(Item.all.count).to eq(1)
    expect{Item.find(2)}.to raise_exception(ActiveRecord::RecordNotFound)
  end

  it "CREATE: can create a new item" do
    item_params = {name: "Yo-Yo", description: "can you walk the dog?", image_url: "www.blank.com"}

    post "/api/v1/items", params: {item: item_params}
    item = Item.last

    expect(response.status).to eq(201)
    expect(item["id"]).to eq(item_params[:id])
    expect(item["name"]).to eq(item_params[:name])
    expect(item["description"]).to eq(item_params[:description])
    expect(item["image_url"]).to eq(item_params[:image_url])

    # expect(item.created_at).to eq()
    # expect(item.updated_at).to eq()
  end


end
