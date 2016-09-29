class GamesController < ApplicationController
  def new
    @game = Game.new
    if(@game.save)
      render "./index.html.erb"
    else 
      self.new
    end
  end
  
  def turn
    id = turn_params[:gameId].to_i
    @game = Game.find(id)
    @game.current_board = JSON.parse(turn_params[:board])
    @game.board = turn_params[:board]
    @game.colors_raw = JSON.parse(turn_params[:colors])
    @game.colors = turn_params[:colors]
    @conditions = @game.win?
    @score = @game.get_score
    @game.primary_color = @score['scores'][0][0]
    if(@conditions[:board_locked])
      @game.score = @score['points']
      @game_stats = Game.stats(@score)
    end
    @game.save
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
