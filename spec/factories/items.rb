FactoryBot.define do
  factory :item do
    name              {Faker::Name.name}
    information       {Faker::Lorem.sentence}
    category_id       {'2'}
    condition_id      {'2'}
    shipping_charge_id{'3'}
    prefecture_id     {'25'}
    lead_time_id      {'2'}
    price             {'500'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end