class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    binding.pry
  end
end
