# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    Role.create(name: 'project_manager')
    @user = create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'assigns @users' do
      user = @user
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #assign_role' do
    it 'assigns role' do
      user = @user
      get :assign_role, params: { id: user.id, user: { roles: ['', :project_manager] } }
      response.should redirect_to(:users)
    end
  end
end
