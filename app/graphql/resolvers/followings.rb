module Resolvers
  class Followings < Resolvers::BaseResolver
    type [ObjectTypes::FollowingType], null: false

    argument :users_id, Integer, required: true

    def resolve(users_id:)
      Following.where(users_id: users_id)
    end
  end
end
