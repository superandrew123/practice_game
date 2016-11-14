require 'rails_helper'

describe User, type: :model do 
  before :example do 
    create_user_and_game
  end
  it '#generate_url runs and saves a url for a User' do 
    expect(@user.url.class).to eq(String)
  end
  it '#global_stats returns hash with the approriate keys' do 
    expect(@user.global_stats.keys).to eq(['total_games','games_per_color','median_score','modal_score'])
  end
  private
    def create_user_and_game
      @user = User.create
      @game = Game.new
      @game.status = 'complete'
      @game.board = "[[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true}],[{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":2,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}]]"
      @game.colors = "[\"red\",\"blue\",\"green\",\"yellow\"]"
      @game.score = 5
      @game.user_id = @user.id
      @game.save
    end
end