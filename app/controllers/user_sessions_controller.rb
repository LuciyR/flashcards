class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    if current_user
      redirect_to root_url
    else
      @user = User.new
    end
  end

  def create
    if @user = login(session_params[:email], session_params[:password])
      redirect_back_or_to root_url, notice: 'С возвращением!'
    else
      flash.now[:alert] = 'Email или пароль не совпадают'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_url, notice: 'До встречи!')
  end

  private

  def session_params
    params.require(:user_sessions).permit(:email, :password)
  end
end
