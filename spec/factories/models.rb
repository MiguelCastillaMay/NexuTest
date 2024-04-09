FactoryBot.define do
  factory :model do
    name { 'Corolla' }
    average_price { 320000 }
    association :brand, factory: :brand

    trait :another_model do
      name { 'Yaris' }
      average_price { 200000 }
    end
  end
end