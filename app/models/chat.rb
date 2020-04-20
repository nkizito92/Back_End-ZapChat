class Chat < ApplicationRecord
    has_many :comments
    belongs_to :guest
end
