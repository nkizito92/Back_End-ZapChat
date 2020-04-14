class Chat < ApplicationRecord
    belongs_to :guest
    has_one :image
    validates :image, presence: false
end
