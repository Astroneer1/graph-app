module ObjectTypes
  class FollowingType < BaseObject
    global_id_field :id
    field :users_id, Integer, null: false
    field :token, String, null: false
  end
end
