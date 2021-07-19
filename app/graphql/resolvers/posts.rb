module Resolvers
  class Posts < Resolvers::BaseResolver
    argument :user_id, ID, loads: ObjectTypes::UserType, required: true

    type [ObjectTypes::PostType], null: false

    def resolve(user:)
      Post.where(user_id: user.id)
    end
  end
end
