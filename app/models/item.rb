class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  belongs_to :area
  belongs_to :charge
  belongs_to :condition
  belongs_to :genre
  belongs_to :leadtime

  validates :image, :title, :content, presence: true
  validates :genre_id, :condition_id, :charge_id, :area_id, :leadtime_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, presence: true,
             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  has_one_attached :image

end
