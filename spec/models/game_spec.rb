# Model testing for Game model
require 'rails_helper'

describe Game, type: :model do 
  it 'should create a new game' do 
    games = Game.all.length
    Game.create
    expect(Game.all.length).to eq(games + 1)
  end
end