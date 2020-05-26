class Likable < ApplicationRecord
    belongs_to :chat
    belongs_to :comment
end
