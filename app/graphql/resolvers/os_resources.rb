module OsResource
    class OsResources < GraphQL::Schema::Resolver
        type[Resources::OsResourceType], null: false

        def resolve
            OsResource.all
        end
    end
end