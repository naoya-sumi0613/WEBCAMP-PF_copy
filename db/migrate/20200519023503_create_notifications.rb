class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :photo_id
      t.integer :comment_id
      t.integer :action, null: false, default: 0
      t.boolean :checked, null: false, default: false

      t.timestamps
    end

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :photo_id
    add_index :notifications, :comment_id
  end
end
