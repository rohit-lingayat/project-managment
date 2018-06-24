# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  before :each do
    Role.create(name: 'project_manager')
    @user = create(:user)
    sign_in @user
  end

  describe 'UPDATE #update' do
    it 'Update project' do
      todo = create(:todo)
      patch :update, params: { id: todo.id, todo: { status: 'ToDo' } }
      flash[:notice].should_not be_nil
      expect(assigns[:todo].status).to eq('ToDo')
    end
  end
end
