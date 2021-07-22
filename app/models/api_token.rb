class ApiToken < ApplicationRecord
  include RelayIdentifiable
  has_secure_token :token
end
