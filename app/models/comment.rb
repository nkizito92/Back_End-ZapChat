class Comment < ApplicationRecord
    has_many :likables, dependent: :destroy
    belongs_to :chat
    belongs_to :guest
end
