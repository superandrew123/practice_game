# Model testing for Game model
require 'rails_helper'

describe Game, type: :model do
  before(:example) do 
    @user = User.create
    @game = Game.new
  end
  it 'should not create a new game without a user' do     
    expect(@game.save).to eq(false)
  end
  it 'should create a new game' do 
    games = Game.all.length
    @game.user_id = @user.id
    @game.save
    expect(Game.all.length).to be > games
  end
end