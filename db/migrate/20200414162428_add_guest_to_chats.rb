class AddGuestToChats < ActiveRecord::Migration[6.0]
    def change
        add_column :chats, :guest_id, :integer
    end 
end