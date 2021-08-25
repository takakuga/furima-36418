class BuyResidence
  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :buy_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token

  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buy  = Buy.create(user_id: user_id, item_id: item_id)
    Residence.create(buy_id: buy.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end