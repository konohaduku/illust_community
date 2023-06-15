class Illust < ApplicationRecord
   has_one_attached :illust_image
     belongs_to :user
     has_many :illust_comments, dependent: :destroy
     has_many :favorites, dependent: :destroy
    has_many :illust_tags,dependent: :destroy
    has_many :tags,through: :illust_tags

  validates :illust_name,presence:true
  validates :illust_body,presence:true,length:{maximum:200}

   def get_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height]).processed
   end


    def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.illust_tags.delete IllustTag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_illust_tag = IllustTag.find_or_create_by(tag_name: new)
      self.illust_tags << new_illust_tag
    end
    end
end
