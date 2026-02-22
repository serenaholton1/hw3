class EntriesController < ApplicationController
  def new
    @place = Place.find_by({ :id => params["place_id"] })
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]

    if @entry.save
      redirect_to "/places/#{@entry.place_id}"
    else
      @place = Place.find_by({ :id => @entry.place_id })
      render "new", status: :unprocessable_entity
    end
  end
end
