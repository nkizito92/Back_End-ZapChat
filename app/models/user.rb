class User < ApplicationRecord
    has_many :chats, dependent: :destroy
    has_secure_passord 
end
