module Resolvers
  class Posts < Resolvers::BaseResolver
    argument :users_id, Integer, required: true

    type ObjectTypes::PostType, null: false

    def resolve(users_id:)
      Post.find_by(users_id: users_id)
    end
  end
end
