require 'rails_helper'

describe UsersController, type: :controller do

  before(:each) do
    users = create_list(:user, 2)
    @owner, @other = users
  end

  context 'user profile' do
    it 'can be edited by owner' do
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(@owner)
      get :edit, params: {id: @owner}
      expect(response.status).to eq(200)
    end
    it 'can not be edited by others' do
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(@other)
      get :edit, params: {id: @owner}
      expect(response.status).to eq(302)
    end
  end
end
