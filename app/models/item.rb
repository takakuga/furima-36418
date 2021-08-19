class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  # has_one :buy
  has_one_attached :image
  
  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_delivery_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999 }

end
