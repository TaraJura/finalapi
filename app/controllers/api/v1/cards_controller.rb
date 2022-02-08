module Api
  module V1
    class CardsController < BaseController
      skip_before_action :verify_authenticity_token




      def index
        cards = Card.all
        render jsonapi: cards
      end





    end
  end
end
