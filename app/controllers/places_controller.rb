class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    # start with a new Place
    # assign user-entered form data to Place's columns
    @place = Place.new
    @place["name"] = params["name"]

    # save Place row
    @place.save

    # redirect user
    redirect_to "/places"
  end

  def show
    @place = Place.find_by({ :id => params["id"] })
    @entries = Entry.where({ :place_id => @place&.id }).order({ :occurred_on => :desc, :created_at => :desc })
  end
end
