require 'rails_helper'

RSpec.describe Api::V1::PagesController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.scraperry.v1" }

  describe "GET #index" do
    it "returns the information about a reporter on a hash" do
      @page = create :page

      get :index, format: :json

      pages_response = JSON.parse(response.body, symbolize_names: true)
      expect(pages_response[0][:url]).to eql @page.url
    end

    it "returns 200" do
      get :index, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "when is successfully created" do
      it "renders the json representation for the page record just created" do
        @page_attributes = attributes_for :page

        post :create, { page: @page_attributes }, format: :json

        page_response = JSON.parse(response.body, symbolize_names: true)
        expect(page_response[:url]).to eq @page_attributes[:url]
      end

      it "returns 201" do
        @page_attributes = attributes_for :page

        post :create, { page: @page_attributes }, format: :json

        expect(response).to have_http_status(:created)
      end
    end

    context "when is not created" do

      it "renders an errors json" do
        @invalid_user_attributes = { url: "" }

        post :create, { page: @invalid_user_attributes }, format: :json

        page_response = JSON.parse(response.body, symbolize_names: true)
        expect(page_response).to have_key(:errors)
      end

      it "renders the json errors on why the page could not be created" do
        @invalid_user_attributes = { url: "" }

        post :create, { page: @invalid_user_attributes }, format: :json

        page_response = JSON.parse(response.body, symbolize_names: true)
        expect(page_response[:errors][:url]).to include "can't be blank"
      end

      it "responds with 422" do
        @invalid_page_attributes = { url: "" }

        post :create, { page: @invalid_page_attributes }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
