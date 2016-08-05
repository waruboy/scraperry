class Page < ActiveRecord::Base
  validates :url, presence: true
  validates :status, presence: true
end
