# Periodic Table of Echonest

###Developer: Patrick Morgan

###<http://periodic-table-of-echonest.herokuapp.com/>

####What does it do?

*This site visualizes some of The Echonest's most powerful yet most vague metrics into charts that rank today's most popular musicians.*
  
####Why this idea?

I love the work that The Echonest is doing right now because they're really pushing boundaries when it comes to big data and music. While exploring their API, a few key metrics caught my eye: "hotttnesss", "familiarity" and "discovery". Each is measured as a percentage and comes with an associated rank that tells us how that metric stands up against all other echonest artists. 

Take a look at Katie Perry's stats in the sample JSON below. You can see that she's ranked number one in terms of "hotttnesss" (with a percentage of roughly 99%), 70th in "familiarity" and only 24,557th in "discovery". 

I thought these metrics might provide a good foundation for a new chart-based music discovery site like Twitter Music (previously We Are Hunted) or the Billboard Hot 100. *But instead of charting individual songs as they float to the top, this data allows me to chart artist performance more comprehensively.*

**This site is an initial exploration into putting those metrics to work.**

######Sample JSON response:
![echonest_metrics](https://www.evernote.com/shard/s82/sh/0236db35-35fb-45d2-aca3-e2b2a8ae033b/58b121867acb0fd4a4890b553777efb8/deep/0/echonest_metrics.png "Echonest Metrics")

#### How should I read the charts?
*See the info associated with each screenshot below*  
  
####Basic specs

On the back end, *The Periodic Table of Echonest* uses Ruby on Rails and a Postgresql database to serve up JSON. On the front-end, the app relies mainly on Backbone.js (and its dependencies jQuery and Underscore). I used Handlebars.js for templating and Zurb Foundation for the grid (and quick styling).

---
##4 Main Charts Explained
**In each artist box, the number in the upper left corner represents that artist's hottness rank (from 1 to 100). The number in the upper right corner represents my combined, overall score (the lower the better).**

###Hottest Artists
The top 100 hottest artists, *color coded from hot (most red) to cool (least red)*. Miley is highlighted in the screenshot (that's why her square is white). **Each artist's shade of red is maintained throughout the other charts.**

![hottest_artists](https://www.evernote.com/shard/s82/sh/b88a549b-2e09-4f96-affa-0f350876e6ad/b8c6a3f8fdc1e3359e8ae885c1aebb94/deep/0/hottest_artists.png "Hottest Artists")

###Rising Artists
This view filters the artists who are rising most quickly to the top of the chart. **While the artists at the top in this view may not be super hot yet, be on the lookout – they're picking up listeners. Fast.**

![rising_artists](https://www.evernote.com/shard/s82/sh/068df61a-0191-4b6b-973e-14905d72a442/de6a0e62abc3b8d5180493a0430b58c6/deep/0/Periodic-Table-of-Echonest.png "Rising Artists")

###Most Familiar Artists
This view filters the artists who are **most familiar to the overall population.** Unsurprisingly, The Beatles are number one. More surprisingly, Eminem beats out U2, Lady Gaga and others for number 2.

![most_familiar_artists](https://www.evernote.com/shard/s82/sh/bc0869c6-1a00-4ee8-affe-39359587d348/448b819c35ce2d3fc7d90d12c87d396f/deep/0/most_familiar_artists.png "Most Familiar Artists")

###Overall Score
This view shows the results of my combined score (the number you see in the top right hand corner of each artist box). *Think of it as the popularity sweet spot. The lower the score, the closer to the sweet spot.* **Theoretically, the best possible score would be 3: Number 1 hottest, Number 1 most familiar, Number 1 fastest rising.** At the time I took the screenshots, Lorde took top honors overall. This makes sense. She burst onto the scene this past year and has been all over the airwaves. So not only is she popular right now, but she's becoming more familiar. At the same time though, she's still relatively new, so lots of people are still discovering her for the first time. 

![overall_score](https://www.evernote.com/shard/s82/sh/b631f764-24f8-475d-b903-6714bf25d95e/feedb8b77906bb5f55047c1ebf2598db/deep/0/overall_score.png "Overall Score")