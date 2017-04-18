class Variant < ApplicationRecord
  belongs_to :product

  validates :style, presence: true
  validates :waist, :length, :inventory_count, numericality: true, presence: true
end
