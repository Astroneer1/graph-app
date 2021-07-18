module Resolvers
  class CurrentUser < Resolvers::BaseResolver
    type ObjectTypes::UserType, null: false
    argument :id, Integer, required: true
    # field :post, ObjectTypes::PostType, null: false

    def resolve(id:)
      User.find(id)
    end
  end
end
