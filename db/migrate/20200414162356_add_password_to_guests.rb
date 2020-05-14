class AddPasswordToGuests < ActiveRecord::Migration[6.0]
    def change 
        add_column :guests, :password, :string
    end

end