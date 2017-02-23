require 'rails_helper'

describe "Store Search API" do
  it "a user can search for stores by zip" do
    visit "/"

    fill_in :search, with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")

    expect(page).to have_content("16 Total Stores")

    within first('.store') do
      expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("DENVER")
      expect(page).to have_content("3.45")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Mobile SAS")
    end
  end
end
