class AddPlayedAtToTrack < ActiveRecord::Migration[5.0]
  def change
    rename_column :tracks, :youtube_url, :youtube_id
    change_column :tracks, :youtube_id, :string
    rename_column :tracks, :played, :playing
    add_column    :tracks, :played_at, :datetime
    add_column    :tracks, :artist, :string
    add_column    :tracks, :title, :string
    add_column    :tracks, :duration, :integer
    add_column    :tracks, :cover_url, :text
  end
end
