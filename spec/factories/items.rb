FactoryBot.define do
  factory :item do
    name             {Faker::Commerce.product_name}
    information      {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(from: 2, to: 11)}
    condition_id     {Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id  {Faker::Number.between(from: 2, to: 3)}
    shipping_area_id {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id  {Faker::Number.between(from: 2, to: 4)}
    price            {1000} 
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/sample1.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end

