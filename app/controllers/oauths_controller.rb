class OauthsController < ApplicationController
  skip_before_filter :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to root_url
      notice: ("Вы вошли спомощью #{provider} аккаунта",
                provider: provider.titleize)
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_url
        notice: ("Вы вошли спомощью #{provider} аккаунта",
                  provider: provider.titleize)
      rescue
        redirect_to user_sessions_path
        alert: ("Вход из аккаунта #{provider.titleize} не выполнен",
                 provider: provider.titleize)
      end
    end
  end

  private

  def auth_params
    params.permit(:provider)
  end
end
