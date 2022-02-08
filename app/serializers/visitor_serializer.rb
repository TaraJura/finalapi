# frozen_string_literal: true

class VisitorSerializer < ApplicationSerializer
  set_type :visitors

  attributes :name, :email, :phone, :identity_card_type, :identity_card_number, :expires, :visitor_type, :visitor_id_expiration, :escort_flag
end