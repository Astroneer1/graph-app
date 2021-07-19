class User < ApplicationRecord
  include RelayIdentifiable
  validates :email, :username, presence: true, uniqueness: true
end
