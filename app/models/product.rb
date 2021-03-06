class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :color

  validates :name, :description, :price, :rating, :stock, presence: true

  has_one_attached :image
end
