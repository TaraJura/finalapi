
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








        Connector.create(visitor_id: params[:id],card_id:1,issued_at: Time.now)
        render jsonapi: Connector.last
      end

#      /////////////////////////////////////////////////////////////////////////////////////// Return card

      def return_card
        Connector.last.update!(returned_at: Time.now)
        render jsonapi: Connector.last
      end

#      /////////////////////////////////////////////////////////////////////////////////////// New Visitor 
      def new
        visitor = Visitor.new
      end

      def edit
      end

      def create
        visitor = Visitor.new(visitor_params)

        respond_to do |format|
          if visitor.save
            format.html { redirect_to visitor_url(visitor), notice: "Visitor was successfully created." }
            format.json { render :show, status: :created, location: visitor }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: visitor.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @visitor.update(visitor_params)
            format.html { redirect_to visitor_url(visitor), notice: "Visitor was successfully updated." }
            format.json { render :show, status: :ok, location: visitor }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: visitor.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @visitor.destroy

        respond_to do |format|
          format.html { redirect_to visitors_url, notice: "Visitor was successfully destroyed." }
          format.json { head :no_content }
        end
      end

      private
        def set_visitor
          @visitor = Visitor.find(params[:id])
        end

        def visitor_params
          params.require(:visitor).permit(:name, :email, :phone, :identity_card_type, :card_id, :identity_card_number, :expires, :customer_id, :visitor_type, :visitor_id_expiration, :escort_flag)
        end
        
        def jsonapi_serializer_class(resource, is_collection)
          JSONAPI::Rails.serializer_class(resource, is_collection)
        rescue NameError
          # your serializer class naming implementation
        end
    end
  end
end
