class Category < ApplicationRecord
  belongs_to :religion
  has_many :subcategories, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
