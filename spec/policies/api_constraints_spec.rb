require 'spec_helper'

RSpec.describe ApiConstraints do
  describe "matches?" do

    it "returns true when the version matches the 'Accept' header" do
      api_constraints_v1 =  ApiConstraints.new(version: 1)

      request = double(host: 'api.scraperry.dev',
                       headers: {"Accept" => "application/vnd.scraperry.v1"})

      expect(api_constraints_v1.matches?(request)).to eq true
    end

    it "returns the default version when 'default' option is specified" do
      api_constraints_v2 = ApiConstraints.new(version: 2, default: true)

      request = double(host: 'api.scraperry.dev')

      expect(api_constraints_v2.matches?(request)).to eq true
    end
  end
end
