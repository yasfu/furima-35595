class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge 
  belongs_to :category
  belongs_to :state
  belongs_to :day_to_ship
  belongs_to :prefecture
  has_one_attached :image
  belongs_to :user

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
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, numericality: {only_integer: true, message: "is invalid. Input half-width characters" }
  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
end
