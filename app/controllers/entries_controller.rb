class EntriesController < ApplicationController

  def index
    @entry = Entry.all
  end

  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["place_id"]}) 
  end


  def new
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry.uploaded_image.attach(params["uploaded_image"])
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
