class AddPrimaryColorToGames < ActiveRecord::Migration
  def change
    add_column :games, :primary_color, :string
  end
end
