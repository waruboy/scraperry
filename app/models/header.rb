# This model represent headres that have been scrapped from a page
class Header < ActiveRecord::Base
  belongs_to :page

  validates :page_id, presence: true
  validates :content, presence: true
  validates :tag, presence: true
end
