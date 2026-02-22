class EntriesController < ApplicationController
  def new
    @place = Place.find_by({ :id => params["place_id"] })
    @entry = Entry.new
  end

  def create
    # start with a new Entry
    # assign user-entered form data to Entry's columns
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]

    # save Entry row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry.place_id}"
  end
end
