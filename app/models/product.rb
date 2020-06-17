class Product < ApplicationRecord
  belongs_to :category, :optional => true
  belongs_to :brand, :optional => true
  belongs_to :type, :optional => true
  has_many :product_items
  has_many :favourite_items
  has_many :reviews

  has_and_belongs_to_many :ingridients

  validates :name, uniqueness: true

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
