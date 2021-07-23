module Mutations
  class SignOut < BaseMutation
    argument :user_id, Integer, required: true
    # argument :token, String, required: true

    field :api_token, ObjectTypes::ApiTokenType, null: false

    def resolve(user_id:)
      api_token = ApiToken.find_by(user_id: user_id, token: context[:api_token]).destroy

      { api_token: api_token }
    end
  end
end
