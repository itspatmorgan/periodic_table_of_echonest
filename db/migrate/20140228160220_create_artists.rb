class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :echonest_id
      t.float :hotttnesss
      t.float :familiarity
      t.float :discovery
      t.string :location
      t.string :official_url
      t.string :lastfm_url
      t.string :similar_artists, :array => true

      t.timestamps 
    end
  end
end
