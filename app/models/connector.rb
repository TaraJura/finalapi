class Connector < ApplicationRecord

  belongs_to :visitor
  belongs_to :card

  validates :visitor, presence: true
  validates :card, presence: true
  
end
