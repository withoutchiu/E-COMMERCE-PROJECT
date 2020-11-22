class Category < ApplicationRecord
  has_many :products
  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
