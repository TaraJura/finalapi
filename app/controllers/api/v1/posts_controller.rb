
module Api
  module V1
    class PostsController < ApplicationController
      deserializable_resource :post, only: [:create, :update]

      def create_params
        params.require(:post).permit(:title, :content, :tag_ids)
      end

      def create
        post = Post.create(create_params)
        render jsonapi: post,
              include: [:author, comments: [:author]],
              fields: { users: [:name, :email] },
              status: :created
      end
         
      def category_params
        params.require(:category).permit(:category_number, :public, :title_sgort_cz, ...)
      end
      
      def category_params
              jsonapi_deserialize(
                params,
                only: %i[
                  category_number public title_short_cz title_short_en title_long_cz
                  title_long_en description_cz description_en
                ]
              )
      end
    end
  end
end

