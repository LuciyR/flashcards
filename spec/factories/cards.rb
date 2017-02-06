FactoryGirl.define do
  factory :card do
    original_text 'Hello'
    translated_text 'Hallo'
    association :user, factory: :user
  end
end
