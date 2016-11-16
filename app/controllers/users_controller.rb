class UsersController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @user.delete_unfinished_games
    @date = @user.created_at.to_date.to_s
  end
  def stats
    @user = User.find_by_id(session[:user_id])
    respond_to do |format|
      format.json {render :json => @user.stats}
    end
  end
end
