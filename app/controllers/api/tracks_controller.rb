class Api::TracksController < ApplicationController

  def index
    #TODO: order correctly...
    @tracks = Track.order(created_at: :asc)
  end

  def create
    begin #TODO: background the youtube query
      video = Yt::Video.new id: track_params[:youtube_id]
      unless @track = Track.create!(youtube_id: video.id, title: video.title, duration: video.duration, body: track_params['body'], cover_url: video.thumbnail_url)
        render json: { message: @track.errors.full_messages.join('. ') }, status: :bad_request
      end
    rescue
      render json: { message: 'Failed to connect to youtube' }, status: :bad_request
    end
  end

  private

  def track_params
    params.require(:track).permit(:youtube_id, :body)
  end
end
