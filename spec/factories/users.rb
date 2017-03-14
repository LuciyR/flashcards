FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@simpson.com"}
    password 'password'
  end
end
