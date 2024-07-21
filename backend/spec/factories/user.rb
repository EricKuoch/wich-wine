FactoryBot.define do
  factory :user do
    email { 'default@example.com' }
    password { 'password' }
    role { :user }
  end
end