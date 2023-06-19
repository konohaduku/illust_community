class Product < ApplicationRecord
  has_many :illust_images, dependent: :destroy
  accepts_nested_attributes_for :illust_images
end
