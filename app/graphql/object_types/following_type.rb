module ObjectTypes
  class FollowingType < BaseObject
    global_id_field :id
    field :user_id, Integer, null: false
    field :following_user_id, Integer, null: false
  end
end
