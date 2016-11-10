class GamesController < ApplicationController
  def new
    session[:user_id] = false
    if !session[:user_id]
      @user = User.create
      session[:user_id] = @user.id
    else 
      @user = User.find(session[:user_id])
    end
    @game = Game.new
    @game.user_id = @user.id
    @game.save
    session[:game_id] = @game.id
    render "./index.html.erb"
  end

  def turn
    @game = Game.find(session[:game_id])
    @game.current_board = JSON.parse(turn_params[:board])
    @game.board = turn_params[:board]
    @game.colors_raw = JSON.parse(turn_params[:colors])
    @game.colors = turn_params[:colors]
    @conditions = @game.win?
    @score = @game.get_score
    @game.primary_color = @score['scores'][0][0]
    @game.score = @score['points']
    @game.save
    if(@conditions[:win] || @conditions[:board_locked])
      @game_stats = Game.stats(@score)
    end
    render :score_board, layout: false
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game, {})
    end
    def turn_params
      params.require(:game).permit!
    end
end
