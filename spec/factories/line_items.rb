FactoryBot.define do
  factory :line_item do
    order_id { nil }
    product_id { nil }
    name {'鋼鐵人盾牌'}
    amount { 2 }
    price { 4999 }
  end
end
