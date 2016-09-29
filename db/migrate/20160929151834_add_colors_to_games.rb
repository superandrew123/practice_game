class AddColorsToGames < ActiveRecord::Migration
  def change
    add_column :games, :colors, :string
  end
end
