class AddressOrder
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :municipality, :street, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(price: price, user_id: user_id)
    Address.create(postal_code: zip_code, prefecture: area_id, city: street, building_name: building, phone_number: phone_number, order_id: order_id)
  end

end