class Chat < ApplicationRecord
    has_many :comments, dependent: :delete_all
    belongs_to :guest, dependent: :delete
end
