require 'rails_helper'
Capybara.ignore_hidden_elements = false

describe 'Card creation' do
  before(:each) do
    @user = create(:user)
    login_user(@user, 'password')
    visit new_card_path
  end

  context 'new card' do
    it 'with attachment' do
      fill_in('card_original_text', with: 'card')
      fill_in('card_translated_text', with: 'karte')
      attach_file('card_image', Rails.root + 'app/assets/images/default.png')
      click_button 'Готово'
      expect(page).to have_content('Карточка создана')
    end
  end
end
