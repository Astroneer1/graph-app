module ObjectTypes
  class ApiTokenType < BaseObject
    global_id_field :id
    field :user_id, Integer, null: false
    field :token, String, null: false
  end
end
