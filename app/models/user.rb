class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true

  # has_many :photos
  has_many :collections
  has_many :images, through: :collections
end
