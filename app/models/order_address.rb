class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture, :city, :address, :building, :phone_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :token
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :product_id
  end
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }

  def save
    order = Order.create(user_id: user_id, product_id: product_id)

    Address.create(zip_code: zip_code, prefecture: prefecture, city: city, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
