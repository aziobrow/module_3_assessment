require 'rails_helper'

feature "User visits the home page" do
  scenario "and views items." do
    create_list(:item, 3)
    visit "/"
    
    expect(page).to have_css(".item", count: 3)
  end
end
