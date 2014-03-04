// ** Artist Model ** //
var Artist = Backbone.Model.extend({
});

// ** Individual Artist View ** //
var ArtistView = Backbone.View.extend({

  tagName: 'li',

  template: Handlebars.compile($('#artistview-template').html()),

  render: function(){
    var percent = this.model.attributes.hotttnesss/100;
    var gradient = 255-parseInt(Math.pow(255,percent*percent));
    var opacity = percent*percent;

    this.$el.html(this.template(this.model.attributes));
    this.$el.css({"background-color": "rgba(255,"+gradient+","+gradient+","+opacity+")"});
    this.$el.css({"color": "black"});

    return this;
  },

  // showInfo: function(){ 
  //   var id = this.model.attributes.echonest_id;

  //   if ( $( "#"+id ).is( ":hidden" ) ) {
  //     $( "#"+id ).slideDown("fast");
  //   } else {
  //     $( "#"+id ).slideUp();
  //   }
  // },
});

//** Collection **//
var ArtistCollection = Backbone.Collection.extend({
  model: Artist,

  url: '/',

  initialize: function(){
    this.fetch()
  },

  sort_key: 'hotttnesss',

  comparator: function(a, b){
    a = a.get(this.sort_key);
    b = b.get(this.sort_key);
    return a < b ? 1
          : a > b ? -1
          : 0;
  },

  sortByField: function(fieldName){
    this.sort_key = fieldName;
    this.sort();
  },
});

//** Artist List View **//
var ArtistListView = Backbone.View.extend({
  el: '#artist-list',

  initialize: function(){
    this.listenTo(this.collection, 'add', this.renderArtist)
  },

  renderArtist: function(artist){
    artist.view = new ArtistView({ model: artist });
    this.$el.append( artist.view.render().el );
    return this
  },

  render: function(){
    var self = this;
    this.$el.empty();
    _.each(this.collection.models, function(artist){
      self.renderArtist(artist);
    });
  },

});

var addEventListeners = function(){

  $("#hotttnesss_nav").click(function(){
    artist_collection.sortByField("hotttnesss");
    artist_list_view.render();
    $("#hotttnesss_nav").addClass("active");
    $("#familiarity_nav").removeClass("active");
    $("#discovery_nav").removeClass("active");
  });

  $("#familiarity_nav").click(function(){
    artist_collection.sortByField("familiarity");
    artist_list_view.render();
    $("#hotttnesss_nav").removeClass("active");
    $("#familiarity_nav").addClass("active");
    $("#discovery_nav").removeClass("active");
  });

  $("#discovery_nav").click(function(){
    artist_collection.sortByField("discovery");
    artist_list_view.render();
    $("#hotttnesss_nav").removeClass("active");
    $("#familiarity_nav").removeClass("active");
    $("#discovery_nav").addClass("active");
  });

  $("#card").hoverHighlight('#C1BDBD');
};

var artist_collection, ArtistView, ArtistListView

$(function(){
  artist_collection = new ArtistCollection();
  artist_view = new ArtistView();
  artist_list_view = new ArtistListView({collection: artist_collection, el: $('#artist-list')});

  addEventListeners();
});
