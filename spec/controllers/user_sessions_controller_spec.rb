require 'rails_helper'

describe UserSessionsController, type: :controller do
  before(:each) do
    @user = create(:user)
  end

  context 'Login' do
    it 'work for registered user' do
      params = {user_sessions: {email: @user.email, password: 'password'}}
      post :create, params: params
      expect(flash[:notice]).to eq('С возвращением!')
    end
  end
end
