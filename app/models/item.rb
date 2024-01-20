class Item < ApplicationRecord
  belongs_to :user
  #has_many :orders

  validates :image, :title, :content, presence: true
  validates :genre_id, :condition_id, :charge_id, :area_id, :leadtime_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, presence: true,
             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  has_one_attached :image

end
