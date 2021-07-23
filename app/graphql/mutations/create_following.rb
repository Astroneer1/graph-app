module Mutations
  class CreateFollowing < BaseMutation
    argument :user_id, Integer, required: true
    argument :following_user_id, Integer, required: true

    field :following, ObjectTypes::FollowingType, null: false

    def resolve(user_id:, following_user_id:)
      following = Following.new(user_id: user_id, following_user_id: following_user_id)
      following.save!

      { following: following }
    end
  end
end
