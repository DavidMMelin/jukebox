class Track < ApplicationRecord
  validates_presence_of :youtube_id

  scope :unplayed, -> { where(played_at: nil) }
end
