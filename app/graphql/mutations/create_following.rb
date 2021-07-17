module Mutations
  class CreateFollowing < BaseMutation
    argument :following_user_id, String, required: true
    argument :follower_user_id, String, required: true

    field :following, ObjectTypes::FollowingType, null: false

    def resolve(following_user_id:, follower_user_id:)
      following = Following.new(following_user_id: following_user_id, follower_user_id: follower_user_id)
      following.save!

      { following: following }
    end
  end
end
