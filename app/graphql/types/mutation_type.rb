module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :sign_up, mutation: Mutations::SignUp
    field :create_following, mutation: Mutations::CreateFollowing
  end
end
