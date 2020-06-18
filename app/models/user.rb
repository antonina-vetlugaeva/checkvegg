class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true
  validates :email, presence: true
  validates :username, presence: true

  def favorite(product)
    favorites.find_or_create_by(product: product)
  end

  def unfavorite(product)
    favorites.where(product: product).destroy_all

    product.reload
  end

  def favorited?(product)
    favorites.find_by(product_id: product.id).present?
  end
end
