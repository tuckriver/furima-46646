FactoryBot.define do
  factory :product do
    product_name        { Faker::Commerce.product_name }
    description         { Faker::Lorem.sentence }
    product_status_id   { 2 }
    category_id         { 2 }
    prefecture_id       { 2 }
    delivery_time_id    { 2 }
    delivery_cost_id    { 2 }
    product_price       { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |product|
      product.product_image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
