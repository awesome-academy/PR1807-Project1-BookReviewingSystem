class Book < ApplicationRecord
  belongs_to :cate
  has_many :chapters
  mount_uploader :image, ImageUploader
end
