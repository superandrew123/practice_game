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
    @conditions = @game.win?
    @score = @game.get_score
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
