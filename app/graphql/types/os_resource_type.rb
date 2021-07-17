module Types
  class OSResourceType < Types::BaseObject
    field :id, ID, null: false
    field :get_resource_timestamps, Types::DateTimeType, null: true
    field :r, Integer, null: true
    field :b, Integer, null: true
    field :swpd, Integer, null: true
    field :free, Integer, null: true
    field :buff, Integer, null: true
    field :cache, Integer, null: true
    field :si, Integer, null: true
    field :so, Integer, null: true
    field :bi, Integer, null: true
    field :bo, Integer, null: true
    field :in, Integer, null: true
    field :cs, Integer, null: true
    field :us, Integer, null: true
    field :sy, Integer, null: true
    field :idle, Integer, null: true
    field :wa, Integer, null: true
    field :st, Integer, null: true
  end
end
