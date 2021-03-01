FactoryBot.define do
  factory :item do
    name             {Faker::Commerce.product_name}
    information      {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(1,11)}
    condition_id     {Faker::Number.between(1,7)}
    delivery_fee_id  {Faker::Number.between(1,3)}
    shipping_area_id {Faker::Number.between(1,48)}
    shipping_day_id  {Faker::Number.between(1,4)}
    price            {1000} 
    association :user
  end
end