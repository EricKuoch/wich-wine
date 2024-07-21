FactoryBot.define do
  factory :tasting_note do
    note { 90 }
    comment { 'Default Comment' }
    association :user
    association :wine
  end
end