class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :lastname_kanji, presence: true, format: { with: /\A[一-龥々]+\z/}
  validates :firstname_kanji, presence: true, format: { with: /\A[一-龥々]+\z/}
  validates :lastname_katakana, presence: true,format: { with: /\A[ァ-ヶー]+\z/}
  validates :firstname_katakana, presence: true,format: { with: /\A[ァ-ヶー]+\z/}
  validates :birth_date, presence: true

  # Associationはproductモデル,purchaseモデルを作成時に都度作成予定
end
