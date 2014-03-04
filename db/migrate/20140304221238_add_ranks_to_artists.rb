class AddRanksToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :hotttnesss_rank, :integer
    add_column :artists, :familiarity_rank, :integer
    add_column :artists, :discovery_rank, :integer
  end
end
