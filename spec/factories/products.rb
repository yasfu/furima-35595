FactoryBot.define do
  factory :product do
    name  { 'ABC' }
    description { Faker::Lorem.sentence }
    category_id { 7 }
    state_id { 3 }
    shipping_charge_id { 2 }
    prefecture_id { 30 }
    day_to_ship_id { 2 }
    price { 2500 }

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
