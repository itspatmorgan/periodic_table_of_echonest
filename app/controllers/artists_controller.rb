class ArtistsController < ApplicationController
  
  # root GET '/' artists#index

  def index
    @artists = Artist.all
    respond_to do |format|
      format.html
      format.json {render json: @artists}
    end
  end
end