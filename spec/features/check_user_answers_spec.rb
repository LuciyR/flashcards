require 'rails_helper'
Capybara.ignore_hidden_elements = false

RSpec.feature 'Check user answers', type: :feature do
  before do
    @card = create(:card)
    @card.update_attributes(review_date: Time.now - 4.days)
    visit root_url
  end

  scenario 'We have form with random card on main page' do
    expect(page).to have_content(@card.translated_text)
  end

  scenario 'Check correct answer' do
    fill_in 'answer', with: @card.original_text
    click_button 'Готово'
    expect(page).to have_content('Верно!')
  end

  scenario 'Check wrong answer' do
    fill_in 'answer', with: 'RoR'
    click_button 'Готово'
    expect(page).
      to have_content("Вы ошиблись. Правильный ответ: #{@card.original_text}")
  end
end
