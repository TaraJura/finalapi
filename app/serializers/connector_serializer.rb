# frozen_string_literal: true

class ConnectorSerializer < ApplicationSerializer
  set_type :connectors

  attributes :visitor_id, :card_id, :issued_at, :returned_at
end