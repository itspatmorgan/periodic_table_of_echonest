# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

echonest_key = ENV['ECHONEST_API_KEY']
consumer_key = ENV['ECHONEST_CONSUMER_KEY']
shared_secret = ENV['ECHONEST_SHARED_SECRET']

top_hottt_query = "http://developer.echonest.com/api/v4/artist/top_hottt?api_key=#{echonest_key}&format=json&results=100&bucket=hotttnesss&bucket=familiarity&bucket=discovery&bucket=artist_location&bucket=urls"

Artist.delete_all

json_top_hottt = HTTParty.get(top_hottt_query)

top_hottt_artists = json_top_hottt["response"]["artists"]

top_hottt_artists.each do |entry|
  artist = Artist.create(
    name: entry["name"],
    echonest_id: entry["id"],
    hotttnesss: entry["hotttnesss"],
    familiarity: entry["familiarity"],
    discovery: entry["discovery"],
    location: entry["artist_location"]["location"],
    official_url: entry["urls"]["official_url"],
    lastfm_url: entry["urls"]["lastfm_url"],
  )
end

## Potential extra queries ##

# similar_artist_query = "http://developer.echonest.com/api/v4/artist/similar?api_key=#{echonest_key}&id=#{ARTISTID}&format=json&results=5&bucket=hotttnesss&bucket=familiarity&bucket=discovery&bucket=artist_location&bucket=urls"

# song_api_query = http://developer.echonest.com/api/v4/song/search?api_key=LNXHREDQVF9MNEBD3&format=json&results=20&bucket=song_hotttnesss&bucket=song_currency&bucket=artist_hotttnesss&bucket=artist_familiarity&bucket=artist_discovery&bucket=audio_summary&sort=song_hotttnesss-desc

# http://developer.echonest.com/api/v4/artist/top_hottt?api_key=LNXHREDQVF9MNEBD3&format=json&results=100&bucket=hotttnesss&bucket=familiarity&bucket=discovery&bucket=artist_location&bucket=urls&bucket=images&bucket=genre
