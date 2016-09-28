class AddScoreToGames < ActiveRecord::Migration
  def change
    add_column :games, :score, :integer
    add_column :games, :board, :string
  end
end
