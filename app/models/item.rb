class Item < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :image, :title, :content, :price, presence: true
  validates :genre_id, :condition_id, :charge_id, :area_id, :leadtime_id, numericality: { other_than: 1, message: "can't be blank"} 
  has_one_attached :image

end
