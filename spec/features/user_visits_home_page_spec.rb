require 'rails_helper'

feature "User visits the home page" do
  before do
    create_list(:item, 3)
    visit "/"
  end

  scenario "and views items." do
    expect(page).to have_css(".item", count: 3)
  end

  scenario "and searches for zip code" do
    save_and_open_page
    fill_in 'q', :with => '80202'
    click_on "Search"

    expect(current_path).to eq(search_path)
  end
end
