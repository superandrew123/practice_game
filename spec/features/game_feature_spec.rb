require 'rails_helper'

# Testing features for Games
feature "Creating a new game", type: :feature do
  scenario "should have a link to a user's games" do 
    visit root_path
    expect(page.html).to have_content('My Games')
  end
  # scenario "clicking on My Games should list all of a users games" do
  #   visit root_path
  #   click_link('My Games')
  #   expect(page.html).to have_content('My Games')
  #   expect(page.all('div.prev-game').length).to be > 0
  # end
end