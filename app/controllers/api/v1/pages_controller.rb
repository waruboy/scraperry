module Api
  module V1
    # Controllers of page endpoint
    class PagesController < ApplicationController
      def index
        @pages = Page.all
        render json: @pages
      end

      def create
        page = Page.new(page_params)
        page.status = 'requested'
        if page.save
          ParsePageJob.perform_async(page.id)
          render json: page, status: :created
        else
          render json: { errors: page.errors }, status: :unprocessable_entity
        end
      end

      private

      def page_params
        params.require(:page).permit(:url)
      end
    end
  end
end
