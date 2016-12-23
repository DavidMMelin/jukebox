class Api::TracksController < ApplicationController

  def index
    #TODO: order correctly...
    @tracks = Track.order(created_at: :asc)
  end

  def create
    unless @track.create(track_params)
      render json: { message: @track.errors.full_messages.join('. ') }, status: :bad_request
    end
  end

  private

  def track_params
    params.require(:track).permit(:youtube_id, :title, :artist, :duration, :body, :cover_url)
  end
end
