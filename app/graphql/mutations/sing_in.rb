module Mutations
    class SignUp < BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
  
      field :user, ObjectTypes::UserType, null: false
      field :api_token ObjectTypes::ApiTokenType, null: false

      def resolve(email:, password:)
        user = User.where(email: email, password: password)
        #SecureRandom.alphanumeric
        
        { user: user }
      end
    end
  end
  