module Mutations
  class SignOut < BaseMutation
    def resolve
      api_token = context[:current_user]
      ApiToken.find_by(user_id: api_token.user_id, token: api_token.token).destroy

      nil
    end
  end
end
