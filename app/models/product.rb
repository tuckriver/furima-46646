class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase

  has_one_attached :product_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :delivery_cost
  belongs_to :product_status
  belongs_to :category

  validates :product_name, :description, :product_price, :product_image, presence: true

  validates :prefecture_id, :delivery_time_id, :delivery_cost_id, :product_status_id, :category_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :product_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
