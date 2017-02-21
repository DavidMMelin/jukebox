class Track < ApplicationRecord
  validates_presence_of :youtube_id, :duration

  #Filters
  scope :unplayed, -> { where(played_at: nil) }
  scope :played, -> { where.not(played_at: nil) }
  scope :playing, -> { find_by(playing: true) }
  scope :payed, -> { where.not(price: 0) }
  scope :unpayed, -> { where(price: 0) }
  #Orders
  scope :by_price, -> { order(price: :desc) }
  scope :by_created_at, -> { order(created_at: :desc) }
  scope :by_played_at, -> { order(played_at: :asc) }

  def self.update_playing
    if (playing.played_at + playing.duration.seconds) < Time.now.utc
      playing.update(playing: false, plays_count: playing.plays_count + 1)
      up_next_list(per: 1).first.update(playing: true, played_at: Time.now.utc)
    end
  end

  def self.up_next_list(per: 20)
    up_next =  Track.unplayed.payed.by_price.limit(per)
    up_next += Track.unplayed.unpayed.by_created_at.limit(per - up_next.length) if up_next.length < per
    up_next += Track.played.by_played_at.limit(per - up_next.length) if up_next.length < per
    up_next
  end
end
