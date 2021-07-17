module Resource
    class Resources < GraphQL::Schema::Resolver
        type[Resources::ResourceType], null: false

        def resolve
            OsResource.all
        end
    end
end