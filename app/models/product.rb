class Product < ApplicationRecord
  belongs_to :subcategory

  mount_uploader :image, ImageUploader

  validates_presence_of :model
end
