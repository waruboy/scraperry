require 'rails_helper'

RSpec.describe ParsePageJob do
  describe '#perform' do
    it 'launches ParsePageService' do
      page = create(:page)
      parser = instance_double(ParsePageService)
      allow(parser).to receive(:process!)
      allow(ParsePageService).to receive(:new).and_return(parser)

      ParsePageJob.new.perform(page.id)

      expect(parser).to have_received(:process!).with(page)
    end
  end
end
