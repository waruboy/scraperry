class Api::V1::PagesController < ApplicationController

  def index
    @pages = Page.all
    render json: @pages
  end

  def create
    page = Page.new(page_params)
    page.status = 'requested'
    if page.save
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
