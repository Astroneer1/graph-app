class GraphAppSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  class << self
    def id_from_object(object, _type_definition = nil, _query_ctx = nil)
      return nil unless object

      GraphQL::Schema::UniqueWithinType.encode(object.class.name, object.id).delete('=')
    end

    def object_from_id(id, _query_ctx = nil)
      type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id + '=' * (-1 * id.size & 3))
      model = Object.const_get(type_name)
      model.find(item_id)
    rescue NameError
      raise GraphqlError::InvalidId, id: id
    end

    def resolve_type(_type, object, _ctx)
      Object.const_get("ObjectTypes::#{object.class.name}Type")
    end
  end
end
