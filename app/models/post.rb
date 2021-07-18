class Post < ApplicationRecord
  validates :user_id, :message, presence: true
end
