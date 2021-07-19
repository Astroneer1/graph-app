class Post < ApplicationRecord
  include RelayIdentifiable
  validates :user_id, :message, presence: true
end
