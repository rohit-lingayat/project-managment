# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before :each do
    Role.create(name: 'project_manager')
    @user = create(:user)
    sign_in @user
  end

  let(:project) { FactoryBot.create(:project, :with_todos) }

  describe 'GET #index' do
    it 'assigns @projects' do
      project = create(:project)
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe 'POST #create' do
    it 'creates porject' do
      expect {
        project_params = FactoryBot.attributes_for(:project, :with_todos)
        post :create, params: { project: project_params }
      }.to change(Project, :count)
    end
  end

  describe 'PATCH #update' do
    it 'update porject' do
      put :update, id: project.id, project: { name: 'Test' }
    end
  end
end
