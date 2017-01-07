class TracksController < ApplicationController

  def index
    @tracks = Track.order(created_at: :asc)
    @track = Track.new
  end

  # def create
  #   begin #TODO: background
  #     video = Yt::Video.new id: track_params[:youtube_id]
  #     if Track.create!(youtube_id: video.id, title: video.title, duration: video.duration, body: track_params.body, cover_url: video.thumbnail_url)
  #       flash[:notification] = 'Track Added!'
  #
  #       # respond_to do |format|
  #       #   format.html
  #       #   format.json { render json: 'good' }
  #       # end
  #       redirect_to :index
  #     else
  #       render json: { message: @track.errors.full_messages.join('. ') }, status: :bad_reques
  #     end
  #
  #   rescue
  #     flash[:error] = 'There was an issue selecting the video'
  #     render :index
  #   end
  # end

  private

  def track_params
    params.require(:track).permit(:youtube_id, :body)
  end

end
