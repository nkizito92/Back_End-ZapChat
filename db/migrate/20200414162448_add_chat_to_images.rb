class AddChatToImages < ActiveRecord::Migration[6.0]
    def change
        add_column :images, :chat_id, :integer
    end     
end