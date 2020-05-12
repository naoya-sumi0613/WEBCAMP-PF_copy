class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :user_id, null: false
      t.string :image_id, null: false
      t.string :word
      t.integer :range, null: false, default: 0

      t.timestamps
    end

    add_index :photos, :user_id
    add_index :photos, :range
    add_index :photos, :created_at
  end
end
