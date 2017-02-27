FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    sequence :uid do |n|
      n
    end
    sequence :name do |n|
       "Fake User#{n}"
    end
    approval_at "2017-02-25 23:28:13"
  end
end
