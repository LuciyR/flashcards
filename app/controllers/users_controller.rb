class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:edit, :update]

  def new
    if current_user
      redirect_to root_url
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_url, notice: 'Пользователь успешно создан'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end
end
