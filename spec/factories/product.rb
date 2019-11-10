FactoryBot.define do
  factory :product do
    name { '商品' }
    content { '商品內文' }
    inventory { 10 }
    price { 100 }
  end
end
