class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge, :category, :state, :day_to_ship, :prefecture


end
