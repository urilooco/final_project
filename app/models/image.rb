class Image < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_many :likes
  has_many :save_images
end
