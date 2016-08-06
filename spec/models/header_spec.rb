require 'rails_helper'

RSpec.describe Header, type: :model do
  it { is_expected.to validate_presence_of(:page_id) }
  it { is_expected.to validate_presence_of(:tag) }
  it { is_expected.to validate_presence_of(:content) }
end
