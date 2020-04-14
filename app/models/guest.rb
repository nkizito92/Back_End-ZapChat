class Guest < ApplicationRecord
    has_many :chats
    has_many :images, through: :chats
end
