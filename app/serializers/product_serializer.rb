class ProductSerializer < ActiveModel::Serializer
  has_many :images
  has_many :variants

  attributes :name, :description
end
