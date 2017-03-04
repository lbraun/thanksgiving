FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    sequence(:uid) { |n| n }
    sequence(:name) { |n| "Fake User#{n}" }
  end
end
