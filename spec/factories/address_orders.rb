FactoryBot.define do
  factory :address_order do
    zip_code { '123-4567' }
    area_id { 1 }
    municipality { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number { '01012345678' }
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
