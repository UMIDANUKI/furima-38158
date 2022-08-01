FactoryBot.define do
  factory :item do
    name                 {Faker::Lorem.characters(number: 40)}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    explanation          {Faker::Lorem.characters(number: 1000)}
    category_id          {Faker::Number.between(from: 2, to: 11)}
    status_id            {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id   {Faker::Number.between(from: 2, to: 3)}
    prefectures_id       {Faker::Number.between(from: 2, to: 48)}
    time_required_id     {Faker::Number.between(from: 2, to: 4)}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end