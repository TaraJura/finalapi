module Api
  module V1
    class CardsController < BaseController
      skip_before_action :verify_authenticity_token




      def index
        cards = Card.all
        render jsonapi: cards
      end






      def create
        card = Card.new(number: params[:number])

        if card.save
          render jsonapi: card
        else
          render jsonapi: card.errors, status: :unproccessable_entity
        end
      end


      private

      def card_params
        params.require(:card).permit(:number)
      end
    end
  end
end
