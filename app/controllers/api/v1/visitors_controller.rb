
module Api
  module V1
    class VisitorsController < JSONAPI::ResourceController
      skip_before_action :verify_authenticity_token



      

      def index
        visitors = Visitor.all
      end









    end
  end
end
