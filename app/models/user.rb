class User < ApplicationRecord
    has_many :chats, dependent: :destroy
    validates :username, :password, presence: true 
    validates :username, uniqueness: true
    validates :password, {length: { in: 6..12 }}
    has_secure_password 

    def token
        JWT.encode({ user_id: self.id }, ENV['my_apps_secret'])
    end
end
