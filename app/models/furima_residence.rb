class FurimaResidence
  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :prefecture, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}

  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buy  = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code. prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
end