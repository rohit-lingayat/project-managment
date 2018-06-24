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
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe 'PATCH #create' do
    it 'Create porject' do
      expect {
        project_params = FactoryBot.attributes_for(:project, :with_todos)
        post :create, params: { project: project_params }
      }.to change(Project, :count)
    end
  end

  describe 'DESTROY #destroy' do
    it 'Delete project' do
      expect {
        delete :destroy, params: { id: project.id }
      }.to_not change(Project, :count)
    end
  end

  describe 'UPDATE #update' do
    it 'Update project' do
      patch :update, params: { id: project.id, project: { name: 'test' } }
      assigns[:project].should_not be_new_record
      flash[:notice].should_not be_nil
      expect(assigns[:project].name).to eq('test')
      response.should redirect_to(:project)
    end
  end

  describe 'UPDATE #update' do
    it 'Not Update project' do
      expect {
        patch :update, params: { id: 6, project: { name: 'test' } }
      }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
