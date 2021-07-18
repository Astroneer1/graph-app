module Resolvers
  class Posts < Resolvers::BaseResolver
    type ObjectTypes::PostType, null: false

    argument :user_id, ID, required: true

    def resolve(user_id:)
      Post.find(user_id)
    end
  end
end
