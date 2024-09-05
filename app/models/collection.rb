class Collection < ApplicationRecord
  validates :match, presence: true
  validates :season, presence: true

  has_one_attached :photo
  belongs_to :user
  has_many :images, dependent: :destroy
  # belongs_to :photo
end
