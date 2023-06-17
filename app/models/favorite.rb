class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :illust
  validates :user_id, presence: true
  validates :illust_id, presence: true

end
