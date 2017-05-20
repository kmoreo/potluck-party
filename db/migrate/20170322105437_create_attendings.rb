class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.integer :potluck_id, null: false
      t.integer :guest_id, null: false
      t.string :dish, null: false#, unique: true ==> should be uniqueness: true
      t.timestamps(null: false)
    end
    add_index :attendings, [:potluck_id, :dish], unique: true #added after final push
  end
end
