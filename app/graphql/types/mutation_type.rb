module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :create_following, mutation: Mutations::CreateFollowing
    field :create_post, mutation: Mutations::CreatePost
  end
end
