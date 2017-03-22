class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.integer :potluck_id, null: false
      t.integer :guest_id, null: false
      t.string :dish, null: false
      t.timestamps(null: false)
    end
  end
end
