class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @user.delete_unfinished_games
    @date = @user.created_at.to_date.to_s
  end
end
