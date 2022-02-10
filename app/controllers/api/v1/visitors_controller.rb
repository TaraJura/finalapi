
module Api
  module V1
    class VisitorsController < BaseController
      skip_before_action :verify_authenticity_token
      before_action :set_visitor, only: %i[ show edit update destroy ]


      def index
        visitors = Visitor.all
        render jsonapi: visitors
      end

      def show
      end

#      /////////////////////////////////////////////////////////////////////////////////////// Issue card


      def issue_card

        visitor = Visitor.find(params[:id])

        if (visitor.connector.last == nil || visitor.connector.last&.returned_at < Time.now)

          card = Card.all.find do |card|
            card.connector.last == nil || card.connector.last.returned_at < Time.now
          end
        
          Connector.create(visitor_id: params[:id],card: card,issued_at: Time.now, returned_at: Time.now + 5.years)
          render jsonapi: Connector.all

        else

          render jsonapi: Connector.all
        end



        response = Typhoeus::Request.new(
          "http://localhost:3000/api/v1/connectors",
          params: Connector.create(visitor_id: params[:id],issued_at: Time.now, returned_at: Time.now + 5.years).serializable_hash,
          method: "post"
        ).run

      end

#      /////////////////////////////////////////////////////////////////////////////////////// Return card

      def return_card

        visitor = Visitor.find(params[:id])

        visitor.connector.last.update!(returned_at: Time.now)
        connector = visitor.connector.last
        render jsonapi: Connector.all
        
        response = Typhoeus::Request.new(
          "http://localhost:3000/api/v1/connectors/#{connector.id}",
          params: ConnectorSerializer.new(connector).serializable_hash,
          method: "patch"
        ).run

      end


      def new
        visitor = Visitor.new
      end


      def edit

      end



      def create
        
        visitor = Visitor.new(visitor_params)

          if visitor.save
            render jsonapi: visitor
          else
            render jsonapi: visitor.errors, status: :unproccessable_entity
          end
        end




      def update

        visitor = Visitor.find(params[:id])

        visitor.update(visitor_params)
        render jsonapi: visitor
      
      end

      def destroy

        visitor = Visitor.find(params[:id])

        visitor.destroy
        render jsonapi: visitor

        respond_to do |format|
          format.html { redirect_to visitors_url, notice: "Visitor was successfully destroyed." }
          format.json { head :no_content }
        end
      end

        def set_visitor
          @visitor = Visitor.find(params[:id])
        end

       def visitor_params
        jsonapi_deserialize(
          params,
          only: [
            :name, :email, :phone, :identity_card_type, :card_id, :identity_card_number, :expires, :customer_id, :visitor_type, :visitor_id_expiration, :escort_flag
          ]
        )
      end
        
        def jsonapi_serializer_class(resource, is_collection)
          JSONAPI::Rails.serializer_class(resource, is_collection)
        rescue NameError
        end
    end
  end
end