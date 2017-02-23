require 'rails_helper'

describe "Store Search API" do
  it "a user can search for stores by zip" do
    visit "/"

    fill_in :search, with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")

    expect(page).to have_content("16 Total Stores")
    # And I should see exactly 10 results
    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
  end

end
