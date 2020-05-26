class Chat < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :guest
end
