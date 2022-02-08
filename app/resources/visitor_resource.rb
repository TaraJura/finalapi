module Api

  module V1
    
    class VisitorResource < JSONAPI::Resource
      attributes :name, :email, :phone, :identity_card_type, :identity_card_number, :expires, :visitor_type, :visitor_id_expiration, :escort_flag

      has_one :connector
    end
  end
end
