require "rails_helper"

feature "user can search for best_buy_location" do
  before do
    visit '/'
    fill_in 'search', :with => '80202'
    click_on "Search"
  end

  context "and searches for zip code" do

    scenario "and sees all relevant store information" do
      expect(current_path).to eq(search_path)
      expect(page).to have_selector ".name"
      expect(page).to have_selector ".city"
      expect(page).to have_selector ".distance"
      expect(page).to have_selector ".phone"
      expect(page).to have_selector ".store-type"
    end

    scenario "and sees all stores as a result of the request" do
      expect(page).to have_content('17 Total Stores')
      expect(page).to have_css(".store", count: 10)

      click_on '2'
      expect(page).to have_css(".store", count: 7)
    end

  end
end
