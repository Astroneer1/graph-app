module Mutations
  class SignUp < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :username, String, required: true

    field :user, ObjectTypes::UserType, null: false

    def resolve(email:, password:, username:)
      user = User.new(email: email, password: password, username: username)
      user.save!

      { user: user }
    end
  end
end
