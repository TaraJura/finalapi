module Api
  
  module V1

    class CardResource < JSONAPI::Resource
      attributes :number

      has_one :connector

    end
  end
end