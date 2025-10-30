class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :product_id, :postal_code, :prefecture, :city, :address, :building, :phone_number, :purchase_id

  with_options presence: true do
    validates :token, :user_id, :product_id, :postal_code, :prefecture, :city, :address, :phone_number, :purchase_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid."}
  end
 

  def save
    # 寄付情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(token: token, user_id: user_id, product_id: product_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end