require 'rails_helper'

describe User, type: :model do 
  before :example do 
    @user = User.create
  end
  it '#generate_url runs and saves a url for a User' do 
    expect(@user.url.class).to eq(String)
  end
end