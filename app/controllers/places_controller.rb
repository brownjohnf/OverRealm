class PlacesController < ApplicationController
  authorize_resource

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end
end
