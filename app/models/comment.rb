class Comment < ApplicationRecord
    belongs_to :chat
    belongs_to :guest
end
