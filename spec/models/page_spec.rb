require 'rails_helper'

RSpec.describe Page, "validations" do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:status) }

  describe "it validates url format" do
    context "when url is not in the right format" do
      it "is not valid" do
        page = build(:page, url: "invalid_url")

        expect(page).not_to be_valid
      end
    end
  end
end
