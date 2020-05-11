class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id, null: false
      t.string :title
      t.text :content, null: false
      t.boolean :status, null: false, default: false

      t.timestamps
    end

    add_index :contacts, :user_id
    add_index :contacts, :status
  end
end
