class Chat < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likables, dependent: :destroy
    belongs_to :guest
end
