class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge, :category, :state, :day_to_ship, :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :description
  end
  validates :name, presence: true, max_length: 40
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 message: 'is out of setting range'}, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } 
  with_options presence: true, numericality: {other_than: 0, message: "can't be blank"} do
    validates :category
    validates :state
    validates :Shipping_Charge
    validates :prefecture
    validates :day_to_ship
  end
end
