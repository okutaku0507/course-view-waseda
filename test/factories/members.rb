FactoryGirl.define do
  factory :member do
    family_name "早稲田"
    first_name "太郎"
    sequence(:email) { |n| "example#{n}@fuji.waseda.jp" }
    sequence(:email_confirmation) { |n| "example#{n}@fuji.waseda.jp" }
    faculty "先進理工"
    subject "応用化学科"
  end
end
