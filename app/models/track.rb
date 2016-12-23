class Track < ApplicationRecord
  validates_presence_of :youtube_url

  scope :unplayed, -> { where(played_at: nil) }
end
