class Guest < ApplicationRecord
    has_many :chats, dependent: :destroy
end
