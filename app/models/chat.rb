class Chat < ApplicationRecord
    has_many :comments, dependent: :destroy
    # belongs_to :guest
    belongs_to :user
end
