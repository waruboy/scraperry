class Page < ActiveRecord::Base
  has_many :links
  has_many :headers

  validates :url, presence: true
  validates :status, presence: true
end
