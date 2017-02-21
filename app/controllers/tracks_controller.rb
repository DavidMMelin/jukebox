class TracksController < ApplicationController

  def index
    Track.update_playing
    @tracks = [Track.playing] + Track.up_next_list
    @track = Track.new
  end

  # Using API to create

  private

  def track_params
    params.require(:track).permit(:youtube_id, :body, :price)
  end

end
