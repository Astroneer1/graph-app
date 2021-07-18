module Mutations
  class CreateFollowing < BaseMutation
    argument :users_id, Integer, required: true
    argument :following_user_id, String, required: true

    field :following, ObjectTypes::FollowingType, null: false

    def resolve(users_id:, following_user_id:)
      following = Following.new(users_id: users_id, following_user_id: following_user_id)
      following.save!

      { following: following }
    end
  end
end
