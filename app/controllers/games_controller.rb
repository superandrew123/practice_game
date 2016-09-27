class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  def index 
  end
  def new
    @game = Game.new
  end

  def turn
    turn = JSON.parse(turn_params[:board])
    
    @conditions = Game.win?(turn)
    @score = Game.get_score(turn)
    
    render :score_board, layout: false
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game, {})
    end
    def turn_params
      params.require(:game).permit(:board)
    end
end
