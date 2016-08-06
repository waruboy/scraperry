class Page < ActiveRecord::Base
  has_many :links

  validates :url, presence: true
  validates :status, presence: true
end
