class CardResource < JSONAPI::Resource
  attributes :number

  has_many :connectors
end
