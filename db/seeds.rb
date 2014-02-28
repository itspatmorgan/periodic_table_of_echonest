# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Echowrap.configure do |config|
  config.api_key = ENV['ECHONEST_API_KEY']
  config.consumer_key = ENV['ECHONEST_CONSUMER_KEY']
  config.shared_secret = ENV['ECHONEST_SHARED_SECRET']
end

# Echowrap.song_search(
#   :key => 8,
#   :mode => 0,
#   :min_tempo => 90,
#   :max_tempo => 100,
#   :artist_min_familiarity => 0.6,
#   :results => 10,
#   :sort => 'danceability-desc').map do |song|
#   puts "#{song.id}"" | ""#{song.artist_name}"" | ""#{song.title}"
# end

# bonobo = Echowrap.artist_search(:name => "Bonobo", :bucket => ['familiarity', 'hotttnesss', 'artist_location', 'years_active', 'images'], :results => 1)
# similar = Echowrap.artist_similar(:name =>"Bonobo", :bucket => ['familiarity', 'hotttnesss', 'artist_location', 'years_active'], :results => 5)
# top_hott_songs = Echowrap.song_search(:sort => 'song_hotttnesss-desc', :results => '20', :bucket => 'song_hotttnesss')
# top_hott_artists = Echowrap.artists_top_hottt(:bucket => ['hotttnesss', 'familiarity', 'artist_location'], :results => 25)

song_api_query = http://developer.echonest.com/api/v4/song/search?api_key=LNXHREDQVF9MNEBD3&format=json&results=20&bucket=song_hotttnesss&bucket=song_currency&bucket=artist_hotttnesss&bucket=artist_familiarity&bucket=artist_discovery&bucket=audio_summary&sort=song_hotttnesss-desc

top_hott_api_query = http://developer.echonest.com/api/v4/artist/top_hottt?api_key=LNXHREDQVF9MNEBD3&format=json&results=100&bucket=hotttnesss&bucket=familiarity&bucket=discovery&bucket=artist_location&bucket=urls

similar_artist_query = http://developer.echonest.com/api/v4/artist/similar?api_key=LNXHREDQVF9MNEBD3&id=ARH6W4X1187B99274F&format=json&results=5&bucket=hotttnesss&bucket=familiarity&bucket=discovery&bucket=artist_location&bucket=urls