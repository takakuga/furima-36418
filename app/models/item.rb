class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :day_delivery
  # has_one :buy
  has_one_attached :image
  
  with_options presence: true do
  validates :image
  validates :product_name
  validates :description
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :postage_id
  validates :prefecture_id
  validates :day_delivery_id
  end
  
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
end