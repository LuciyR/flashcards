Rails.application.config.sorcery.submodules = [:remember_me,
                                               :external]

Rails.application.config.sorcery.configure do |config|

  # -- external --
  config.external_providers = [:github]

  config.github.key = "#{Rails.application.secrets.sorcery_github_key}"
  config.github.secret = "#{Rails.application.secrets.sorcery_github_secret}"
  config.github.callback_url = "#{Rails.application.secrets.sorcery_github_callback_url}"
  config.github.user_info_mapping = {email: 'name'}

  # --- user config ---
  config.user_config do |user|
    user.authentications_class = Authentication
  end

  config.user_class = 'User'
end
