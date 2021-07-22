module Mutations
  class SignIn < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :api_token, ObjectTypes::ApiTokenType, null: false

    def resolve(email:, password:)
      user = User.find_by(email: email, password: password)

      if user.nil?
        raise GraphQL::ExecutionError.new('permission denied', extensions: { code: 'AUTHENTICATION_ERROR' })
      else
        api_token = ApiToken.new(user_id: user.id)
        puts api_token
        api_token.save!
        { api_token: api_token }
      end
    end
  end
end
