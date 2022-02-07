# frozen_string_literal: true

class VisitorSerializer < ApplicationSerializer
  set_type :visitors

  attributes :name, :email
end