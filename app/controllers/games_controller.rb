class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  def index 
    
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game, {})
    end
end
