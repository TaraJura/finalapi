module Api
  
  module V1

    class ConnectorResource < JSONAPI::Resource
      attributes :visitor_id, :card_id

      has_one :visitor
      has_one :card

    end
  end
end
