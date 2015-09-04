# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

echonest_key = ENV['ECHONEST_API_KEY']

echonest_url = 'http://developer.echonest.com/api/v4/artist/top_hottt?api_key=' + echonest_key + '&format=json&results=100&bucket=hotttnesss&bucket=familiarity&bucket=discovery&bucket=artist_location&bucket=urls&bucket=hotttnesss_rank&bucket=familiarity_rank&bucket=discovery_rank'

Artist.delete_all

top_hot_response = HTTParty.get(echonest_url)

top_hot_artists = top_hot_response["response"]["artists"]

top_hot_artists.each do |artist|
  artist = Artist.create(
    name: artist["name"],
    echonest_id: artist["id"],
    hotttnesss: artist["hotttnesss"].round(3)*100,
    familiarity: artist["familiarity"].round(3)*100,
    discovery: artist["discovery"].round(3)*100,
    hotttnesss_rank: artist["hotttnesss_rank"],
    familiarity_rank: artist["familiarity_rank"],
    discovery_rank: artist["discovery_rank"],
    location: artist["artist_location"]["location"],
    official_url: artist["urls"]["official_url"],
    lastfm_url: artist["urls"]["lastfm_url"],
    score: artist["hotttnesss_rank"] + artist["familiarity_rank"] + artist["discovery_rank"]
  )
end

