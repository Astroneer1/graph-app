module ObjectTypes
    class BaseObject < GraphQL::Schema::Object
      field_class Types::BaseField
      implements GraphQL::Types::Relay::Node
      connection_type_class ObjectTypes::BaseConnection
  
      field :database_id, String, null: false
  
      def database_id
        object.id
      end
    end
  end