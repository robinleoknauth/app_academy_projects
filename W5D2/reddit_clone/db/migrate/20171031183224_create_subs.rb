class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs do |t|

      t.string :description
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
