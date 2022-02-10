module Api
  module V1
    class ConnectorsController < BaseController
      skip_before_action :verify_authenticity_token



      def index

        connectors = Connector.all
        render jsonapi: connectors
        
      end

      def update

        connector = Connector.find(params[:id])

        connector.update(connector_params)
        render jsonapi: connector
      
      end



      def connector_params
        jsonapi_deserialize(
          params,
          only: [
            :issued_at, :returned_at, :visitor_id
          ]
        )
      end

    end
  end
end








