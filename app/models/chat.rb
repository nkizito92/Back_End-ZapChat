class Chat < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likables
    belongs_to :guest
end
