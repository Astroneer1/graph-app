module ObjectTypes
  class UserType < BaseObject
    global_id_field :id
    field :email, String, null: false
    field :username, String, null: false
  end
end
