module Resolvers
  class FeedPosts < Resolvers::BaseResolver
    argument :user_id, ID, loads: ObjectTypes::UserType, required: true

    type [ObjectTypes::PostType], null: false

    def resolve(user:)
      user_ids = Following.where(user_id: user.id).pluck(:following_user_id)
      user_ids << user.id
      Post.where(user_id: user_ids).order(created_at: 'DESC')
    end
  end
end
