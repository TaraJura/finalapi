# frozen_string_literal: true

class CardSerializer < ApplicationSerializer
  set_type :cards

  attributes :number
end