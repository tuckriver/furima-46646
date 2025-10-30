class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :product_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :token, :user_id, :product_id, :postal_code, :prefecture_id, :city, :address, :phone_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid."}
  end
 

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end