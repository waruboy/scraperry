require 'rails_helper'

RSpec.describe Api::V1::PagesController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.scraperry.v1" }

  describe "GET #index" do
    before(:each) do
      @page = create :page
      get :index, format: :json
    end

    it "returns the information about a reporter on a hash" do
      pages_response = JSON.parse(response.body, symbolize_names: true)
      expect(pages_response[0][:url]).to eql @page.url
    end

    it { should respond_with 200 }
  end
end
