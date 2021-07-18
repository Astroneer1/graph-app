class Post < ApplicationRecord
  validates :users_id, :message, presence: true
end
