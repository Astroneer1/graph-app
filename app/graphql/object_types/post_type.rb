module ObjectTypes
  class PostType < BaseObject
    global_id_field :id
    field :users_id, Integer, null: false
    field :message, String, null: false
  end
end
