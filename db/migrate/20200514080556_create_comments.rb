class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false
      t.string :comment, null: false
      t.boolean :thanks, null: false, default: false

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :photo_id
  end
end
