module ObjectTypes
  class FollowingType < BaseObject
    global_id_field :id
    field :users_id, Integer, null: false
    field :following_user_id, String, null: false
  end
end
