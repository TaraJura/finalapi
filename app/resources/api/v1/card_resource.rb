module Api
  
  module V1

    class CardResource < JSONAPI::Resource
      attributes :number

      has_many :connectors

    end
  end
end