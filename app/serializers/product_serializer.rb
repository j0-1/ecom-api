class ProductSerializer < ActiveModel::Serializer
  has_many :images
  has_many :variants

  attributes :id, :name, :description
end
