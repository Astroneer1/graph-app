module Resolvers
  class Followings < Resolvers::BaseResolver
    argument :user_id, ID, loads: ObjectTypes::UserType, required: true

    type [ObjectTypes::FollowingType], null: false

    def resolve(user:)
      Following.where(user_id: user.id)
    end
  end
end
