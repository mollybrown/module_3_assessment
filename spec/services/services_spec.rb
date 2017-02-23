require 'rails_helper'

describe BestBuyService do
  it "returns best buy stores within 25 miles of the given zip code" do

    raw_stores = BestBuyService.stores_by_zip("80202",25)

    expect(raw_stores).to be_an(Array)
    # expect(raw_stores.count).to eq(10)

    raw_store = raw_stores.first

    expect(raw_store).to be_a(Hash)
    expect(raw_store).to have_key(:longName)
    expect(raw_store).to have_key(:city)
    expect(raw_store).to have_key(:distance)
    expect(raw_store).to have_key(:phone)
    expect(raw_store).to have_key(:storeType)
  end
end
