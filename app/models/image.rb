class Image < ApplicationRecord
  include ExportPng

  belongs_to :collection
  has_many_attached :photos
end
