class Religion < ApplicationRecord
  has_many :categories, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
