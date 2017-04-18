class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :variants, dependent: :destroy

  validates :name, :description, presence: true
end
