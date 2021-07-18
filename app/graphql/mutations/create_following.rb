module Mutations
  class CreateFollowing < BaseMutation
    argument :user_id, Integer, required: true
    argument :follower_user_id, String, required: true

    field :following, ObjectTypes::FollowingType, null: false

    def resolve(user_id:, follower_user_id:)
      following = Following.new(user_id: user_id, follower_user_id: follower_user_id)
      following.save!

      { following: following }
    end
  end
end
