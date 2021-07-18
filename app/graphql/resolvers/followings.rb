module Resolvers
  class Followings < Resolvers::BaseResolver
    type ObjectTypes::FollowingType, null: false
    argument :users_id, Integer, required: true
    # field :post, ObjectTypes::PostType, null: false

    def resolve(users_id:)
      Following.find_by(users_id: users_id)
    end
  end
end
