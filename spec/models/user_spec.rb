require 'rails_helper'

describe User, type: :model do 
  before :example do 
    create_user_and_game
  end
  it '#generate_url runs and saves a url for a User' do 
    expect(@user.url.class).to eq(String)
  end
  context "#global_stats" do
    it '#total_games returns total games a user has played' do
      expect(@user.total_games).to eq(3)
    end
    it '#games_per_color returns a hash with color keys and game count values' do
      games_per_color = @user.games_per_color
      expect(games_per_color['yellow']).to eq(1)
      expect(games_per_color['blue']).to eq(2)
      expect(games_per_color['red']).to eq(nil)
    end
    it '#global_stats returns hash with the approriate keys' do 
      expect(@user.global_stats).to have_key(:total_games)
      expect(@user.global_stats).to have_key(:games_per_color)
    end
  end
  private
    def create_user_and_game
      @user = User.create
      @game = Game.new
      @game.status = 'complete'
      @game.board = "[[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true}],[{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":2,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}]]"
      @game.colors = "[\"red\",\"blue\",\"green\",\"yellow\"]"
      @game.score = 5
      @game.primary_color = 'yellow'
      @game.user_id = @user.id
      @game.save
      @game2 = Game.new
      @game2.status = 'complete'
      @game2.board = "[[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true}],[{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":2,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}]]"
      @game2.colors = "[\"red\",\"blue\",\"green\",\"yellow\"]"
      @game2.score = 15
      @game2.primary_color = 'blue'
      @game2.user_id = @user.id
      @game2.save
      @game3 = Game.new
      @game3.status = 'complete'
      @game3.board = "[[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true}],[{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":2,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}]]"
      @game3.colors = "[\"red\",\"blue\",\"green\",\"yellow\"]"
      @game3.score = 15
      @game3.primary_color = 'blue'
      @game3.user_id = @user.id
      @game3.save
    end
end