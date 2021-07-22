class Following < ApplicationRecord
  include RelayIdentifiable
  validates :user_id, :following_user_id, presence: true, uniqueness: true
end
