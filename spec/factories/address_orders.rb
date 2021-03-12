FactoryBot.define do
  factory :address_order do
    post_code          { '123-4567' }
    city             { 'あああああ' }
    address         { 'あああああ' }
    building_name   { 'ああああああ'}
    phone_number              { "12345678910" }
    shipping_area_id    { 3 }
    token            { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
