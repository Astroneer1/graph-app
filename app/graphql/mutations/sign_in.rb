module Mutations
    class SignIn < BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
  
      field :api_token ObjectTypes::ApiTokenType, null: false

      def resolve(email:, password:)
        user = User.where(email: email, password: password)
        #api_token = SecureRandom.alphanumeric
        
        { api_token:  api_token}
      end
    end
  end