class Link < ActiveRecord::Base
  belongs_to :page

  validates :url, presence: true
  validates :page_id, presence: true
end
