# frozen_string_literal: true

module RelayIdentifiable
  extend ActiveSupport::Concern

  alias_attribute :database_id, :id

  def to_relay_id
    new_record? ? nil : GraphAppSchema.id_from_object(self)
  end
end
