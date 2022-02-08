module Api
  module V1
    class ConnectorsController < BaseController
      skip_before_action :verify_authenticity_token






      def index

        def @check
         Connector.each do |c| 
           c.card 
         end
        end






        connectors = Connector.all
        render jsonapi: connectors
      end







    end
  end
end








