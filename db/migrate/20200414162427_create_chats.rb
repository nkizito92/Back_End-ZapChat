class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :message
      t.string :guest_id
      t.string :img
      t.integer :like
      t.integer :dislike
      t.integer :laugh
      t.integer :angry
      t.timestamps
    end
  end
end
