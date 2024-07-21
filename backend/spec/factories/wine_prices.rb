FactoryBot.define do
  factory :wine_price do
    price { 20.0 }
    date { Date.today }
    association :wine
    association :website
  end
end