class AddressOrder
  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :building_name, :phone_number, :shipping_area_id, :token, :user_id, :item_id, :token

  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'must be only numbers' }

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, city: city, address: address, building_name: building_name, phone_number: phone_number, shipping_area_id: shipping_area_id, order_id: order.id)
  end
end