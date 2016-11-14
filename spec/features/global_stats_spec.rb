# Still having trouble wrapping my head around feature tests


# # Feature Tests for Global stats. Global stats will be located on the User's page
# require 'rails_helper'

# feature 'Showing global stats', type: :feature do 
#   before :each do
#     @user = User.create
#     session[:user_id] = @user.id
#     @game = Game.new
#     @game.status = 'complete'
#     @game.board = "[[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true}],[{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":2,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}]]"
#     @game.color = "[\"red\",\"blue\",\"green\",\"yellow\"]"
#     @game.score = 5
#     @game.user_id = @user.id
#     @game.save
#   end
#   scenario "user's pages have a link to global stats" do 
#     visit('/' + @user.url)
#     expect(page.html).to have_content('Global Stats')
#   end
# end