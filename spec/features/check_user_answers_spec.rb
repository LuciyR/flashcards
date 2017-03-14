require 'rails_helper'
Capybara.ignore_hidden_elements = false

RSpec.feature 'Main Page', type: :feature do
  before do
    @user = create(:user)
    @card = create(:card, user: @user)
    login_user(@user, 'password')
    @card.update_attributes(review_date: Time.now - 4.days)
    visit root_url
  end

  scenario 'render random card' do
    expect(page).to have_content(@card.translated_text)
  end

  feature 'filling form' do
    scenario 'correct answer' do
      fill_in 'answer', with: @card.original_text
      click_button 'Готово'
      expect(page).to have_content('Верно!')
    end

    scenario 'wrong answer' do
      fill_in 'answer', with: 'RoR'
      click_button 'Готово'
      expect(page).
        to have_content("Вы ошиблись. Правильный ответ: #{@card.original_text}")
    end
  end
end
