class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|

      t.string :title, null: false
      t.integer :ord
      t.integer :album_id
      t.text :lyrics
      t.boolean :bonus, default: false

      t.timestamps
    end
    add_index :tracks, :album_id
  end
end
