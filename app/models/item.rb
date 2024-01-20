class Item < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :title, :content, :genre_id, :condition_id, :charge_id, :area_id, :leadtime_id, :price, presence: true
  has_one_attached :image

end
