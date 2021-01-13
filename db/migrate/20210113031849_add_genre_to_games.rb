class AddGenreToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :genre, :string
  end
end
