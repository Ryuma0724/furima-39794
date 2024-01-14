class Item < ApplicationRecord
  belongs_to :user
  has_many :orders
  belongs_to :address

  validates :text, presence: true
  has_one_attached :image

end
