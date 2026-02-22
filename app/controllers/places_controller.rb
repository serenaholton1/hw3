class PlacesController < ApplicationController
  def index
    @places = Place.order(:name)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]

    if @place.save
      redirect_to "/places"
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find_by({ :id => params["id"] })
    @entries = Entry.where({ :place_id => @place&.id }).order({ :occurred_on => :desc, :created_at => :desc })
  end
end
