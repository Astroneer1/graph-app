module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, resolver: Resolvers::Posts
    field :followings, resolver: Resolvers::Followings
    field :current_user, resolver: Resolvers::CurrentUser
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
  end
end
