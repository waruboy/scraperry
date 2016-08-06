class PageSerializer < ActiveModel::Serializer
  attributes :id, :url, :status, :updated_at

  has_many :headers
  has_many :links
end
