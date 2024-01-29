class AddressOrder
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :municipality, :street, :building, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
    validates :token
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, area_id: area_id, municipality: municipality, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end

end