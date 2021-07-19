module Resolvers
  class CurrentUser < Resolvers::BaseResolver
    argument :id, Integer, required: true

    type ObjectTypes::UserType, null: false

    def resolve(id:)
      User.find(id)
    end
  end
end
