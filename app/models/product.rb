class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge, :category, :state, :day_to_ship, :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
    validates :price
  end
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }
  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
end
