class Illust < ApplicationRecord
   has_one_attached :image
     belongs_to :user
     has_many :illust_comments, dependent: :destroy
     has_many :favorites, dependent: :destroy
    has_many :post_tags,dependent: :destroy
    has_many :tags,through: :post_tags

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
