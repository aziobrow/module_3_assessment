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
    fill_in 'search', :with => '80202'
    click_on "Search"

    expect(current_path).to eq(search_path)
  end

  scenario "and sees a page with store information" do
    fill_in 'search', :with => '80202'
    click_on "Search"
    
    expect(page).to have_content('17 Total Stores')
    expect(page).to have_content('Cherry Creek Mall')
    expect(page).to have_css(".store", count: 10)
  end
end
