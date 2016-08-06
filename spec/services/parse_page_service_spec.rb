require 'rails_helper'

RSpec.describe ApiConstraints do
  describe "#process!" do

    it "saves links on a page" do
      VCR.use_cassette('parse_page') do
        page = create(:page, url: 'http://www.nokogiri.org/tutorials/installing_nokogiri.html')

        ParsePageService.new.process!(page)

        expect(page.links.size).to eq 20
      end
    end

    it "saves headers on a page" do
      VCR.use_cassette('parse_page') do
        page = create(:page, url: 'http://www.nokogiri.org/tutorials/installing_nokogiri.html')

        ParsePageService.new.process!(page)

        expect(page.headers.size).to eq 26
      end
    end

  end
end
