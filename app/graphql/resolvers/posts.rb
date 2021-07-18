module Resolvers
  class Posts < Resolvers::BaseResolver
    type ObjectTypes::PostType, null: false
    argument :users_id, Integer, required: true
    # field :post, ObjectTypes::PostType, null: false

    def resolve(users_id:)
      Post.find_by(users_id: users_id)
    end
  end
end
