module Api
  module V1
    class ConnectorsController < BaseController
      skip_before_action :verify_authenticity_token






      def index
        connectors = Connector.all
        render jsonapi: connectors
      end







    end
  end
end








