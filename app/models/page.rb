class Page < ActiveRecord::Base
  has_many :links, dependent: :destroy
  has_many :headers, dependent: :destroy

  validates :url, presence: true, format: URI.regexp
  validates :status, presence: true
end
