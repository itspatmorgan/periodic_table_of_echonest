# Periodic Table of Echonest

###Developer: Patrick Morgan

###<http://periodic-table-of-echonest.herokuapp.com/>

####What does it do?

*This site visualizes some of The Echonest's most powerful yet most vague metrics*

  1. See the top 100 hottest artists 
  2. Filter rising/emerging artists to the top
  3. Filter most widely known artists to the top
  4. Calculate an overall popularity score based on other metrics
  
####Why this idea?

I love the work that The Echonest is doing because they're really pushing boundaries when it comes to big data and music. While playing around with their API, a few key metrics caught my eye: "hotttnesss", "familiarity" and "discovery". Each is measured as a percentage and comes with an associated "rank" that tells us how that metric stands up against all other echonest artists. 

Take a look at Katie Perry's stats in the sample JSON below. You can see that she's ranked number one in terms of "hotttnesss" (with a percentage of roughly 99%), 70th in "familiarity" and only 24,557th in "discovery". 

I wasn't sure what these metrics meant at first, but I thought they might be a good foundation for a new chart-based music discovery site like Twitter Music (previously We Are Hunted) or even the Billboard Hot 100. This site is an initial exploration into putting those metrics to work.

######Sample JSON response:
![echonest_metrics](https://www.evernote.com/shard/s82/sh/0236db35-35fb-45d2-aca3-e2b2a8ae033b/58b121867acb0fd4a4890b553777efb8/deep/0/echonest_metrics.png "Echonest Metrics")

####Basic specs

On the back end, *The Periodic Table of Echonest* uses Ruby on Rails and a Postgresql database to serve up JSON. On the front-end, the app relies mainly on Backbone.js (and its dependencies jQuery and Underscore). I used Handlebars.js for templating and Zurb Foundation for the grid(and quick styling).

---
##4 Main Sorting Views
In each artist section, the number in the upper left corner represents that artist's hotttnesss rank. The upper right corner represents the combined, overall score (the lower the better).

###Hottest Artists
![hottest_artists](https://www.evernote.com/shard/s82/sh/b88a549b-2e09-4f96-affa-0f350876e6ad/b8c6a3f8fdc1e3359e8ae885c1aebb94/deep/0/hottest_artists.png "Hottest Artists")

###Rising Artists
![rising_artists](https://www.evernote.com/shard/s82/sh/ac3a8d7e-3f66-4fbb-8950-b8b0e97477fa/cf8be10e3f714216abccb4687a6e5a17/deep/0/rising_artists.png "Rising Artists")

###Most Familiar Artists
![most_familiar_artists](https://www.evernote.com/shard/s82/sh/bc0869c6-1a00-4ee8-affe-39359587d348/448b819c35ce2d3fc7d90d12c87d396f/deep/0/most_familiar_artists.png "Most Familiar Artists")

###Overall Score
![overall_score](https://www.evernote.com/shard/s82/sh/b631f764-24f8-475d-b903-6714bf25d95e/feedb8b77906bb5f55047c1ebf2598db/deep/0/overall_score.png "Overall Score")