class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
