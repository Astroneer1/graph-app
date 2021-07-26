module Mutations
  class SignOut < BaseMutation
    def resolve
      api_token = context[:current_user]
      seach_api_token = ApiToken.find_by(user_id: api_token.user_id, token: api_token.token)

      seach_api_token.destroy if seach_api_token.nil?

      nil
    end
  end
end
