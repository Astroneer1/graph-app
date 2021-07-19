class Following < ApplicationRecord
  include RelayIdentifiable
  validates :users_id, :following_user_id, presence: true, uniqueness: true
end
