class Comment < ApplicationRecord
    has_many :likables
    belongs_to :chat
    belongs_to :guest
end
