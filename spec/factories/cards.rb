FactoryGirl.define do
  factory :card do
    original_text 'Hello'
    translated_text 'Hallo'
  end

  factory :checked_card, class: Card do
    original_text 'ruby'
    translated_text 'rubyn'
  end
end
