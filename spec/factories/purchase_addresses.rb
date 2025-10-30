FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { "札幌市" }
    address { '1-1' }
    building { '札幌ハイツ' }
    phone_number {"09012345678"}
    token {"token"}
  end
end
