class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :img
      t.integer :chat_id
      t.integer :guest_id
      t.integer :like
      t.integer :laugh
      t.integer :angry
      t.timestamps
    end
  end
end
