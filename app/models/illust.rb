class Illust < ApplicationRecord
   has_one_attached :image
     belongs_to :user
     has_many :illust_comments, dependent: :destroy
     has_many :favorites, dependent: :destroy
    has_many :post_tags,dependent: :destroy
    has_many :tags,through: :post_tags

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
   def get_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height]).processed
   end
end
