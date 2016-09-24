class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  def index 
    
  end
  def new
    @game = Game.new
  end

  def turn
    turn = JSON.parse(turn_params[:board])
    won = Game.win?(turn)

    if won
      render :win, layout: false
    else 
      render :nothing => true
    end
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
