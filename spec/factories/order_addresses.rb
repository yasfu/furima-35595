FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    prefecture { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '12345678910' }
  end
end
