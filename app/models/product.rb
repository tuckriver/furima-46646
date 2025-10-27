class Product < ApplicationRecord

  belongs_to :user

  has_one_attached :product_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :delivery_cost
  belongs_to :product_status
  belongs_to :category

  #空の投稿を保存できないようにする
  validates :prefecture_id, :delivery_time_id, :delivery_cost_id, :product_status_id, :category_id, :product_name, :description, :product_price, :product_image, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :prefecture_id, :delivery_time_id, :delivery_cost_id, :product_status_id, :category_id, numericality: { other_than: 1, message: "can't be blank"} 
end
