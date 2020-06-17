class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true
  validates :email, presence: true
end
