class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.text :youtube_url
      t.boolean :played, default: false
      t.integer :plays_count, default: 0
      t.text :body
      t.integer :user_id

      t.timestamps

      t.index :created_at
      t.index :played
      t.index :user_id
    end
  end
end
