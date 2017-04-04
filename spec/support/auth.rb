module TestHelpers
  module Features
    def login_user(user, password)
      visit login_url
      fill_in 'user_sessions_email',    with: user.email
      fill_in 'user_sessions_password', with: password
      click_button 'Войти'
    end
  end
end
