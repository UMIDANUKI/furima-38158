FactoryBot.define do
  factory :purchase do

    post_code { '123-4567' }
    prefectures_id { 2 }
    municipalities { '東京都' }
    address { '0-1-2' }
    buildings { 'メゾン一刻' }
    phone_number { 12345678900 }
    token {"tok_abcdefghijk00000000000000000"}
  end

end
