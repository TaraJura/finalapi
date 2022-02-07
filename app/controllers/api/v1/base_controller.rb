# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include JSONAPI::Errors if Rails.env.production?
      include JSONAPI::Fetching
      include JSONAPI::Filtering
      include JSONAPI::Pagination

      DEFAULT_PAGE_SIZE = 30
      before_action :authenticate

      def authenticate
        true
      end

    end
  end
end
