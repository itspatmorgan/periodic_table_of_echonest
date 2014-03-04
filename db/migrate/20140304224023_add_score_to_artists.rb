class AddScoreToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :score, :integer
  end
end
