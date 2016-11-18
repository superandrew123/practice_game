require 'rails_helper'

describe User, type: :model do 
  before :example do 
    @user = User.create
    create_game 'yellow', 5, @user.id
    create_game 'blue', 14, @user.id
    create_game 'blue', 15, @user.id
  end
  it '#generate_url runs and saves a url for a User' do 
    expect(@user.url.class).to eq(String)
  end
  context "#stats" do
    it '#total_games returns total games a user has played' do
      expect(@user.total_games).to eq(3)
    end
    it '#games_per_color returns a hash with color keys and game count values' do
      games_per_color = @user.games_per_color
      expect(games_per_color['yellow']).to eq(1)
      expect(games_per_color['blue']).to eq(2)
      expect(games_per_color['red']).to eq(nil)
    end
    it '#mean_score returns the average score' do 
      expect(@user.mean_score).to eq(11.33)
    end
    it '#modal_score returns the mode if there is a modal score' do 
      create_game 'blue', 5, @user.id
      expect(@user.modal_score).to eq(5)
    end
    it '#modal_score returns "No Modal Score" if there is no mode' do 
      expect(@user.modal_score).to eq('No Modal Score')
    end
    it '#stats returns hash with the approriate keys' do 
      expect(@user.stats).to have_key(:total_games)
      expect(@user.stats).to have_key(:games_per_color)
      expect(@user.stats).to have_key(:mean_score)
      expect(@user.stats).to have_key(:modal_score)
    end
  end

  private
    def create_game(primary_color, score, user_id)
      board = "[[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"green\",\"dead\":true}],[{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":2,\"color\":\"green\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"blue\",\"dead\":true}],[{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true},{\"clicks\":1,\"color\":\"red\",\"dead\":true},{\"clicks\":1,\"color\":\"yellow\",\"dead\":true}]]"
      game = Game.new
      game.status = 'complete'
      game.board = board
      game.colors = "[\"red\",\"blue\",\"green\",\"yellow\"]"
      game.score = score
      game.primary_color = primary_color
      game.user_id = user_id
      game.save
    end
end