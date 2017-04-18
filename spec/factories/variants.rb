FactoryGirl.define do
  factory :variant do
    product
    waist 1
    length 1
    style "MyString"
    inventory_count 1
  end
end
