require 'rails_helper'

feature "User visits the home page" do
  before do
    create_list(:item, 3)
    visit "/"
  end

  scenario "and views items." do
    expect(page).to have_css(".item", count: 3)
  end
end
