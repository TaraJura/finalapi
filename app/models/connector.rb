class Connector < ApplicationRecord
  belongs_to :visitor
  belongs_to :card
end
