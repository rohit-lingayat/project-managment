require 'spec_helper'

describe User do
  context 'it will return project manger only' do
    it 'should have a user with manager role' do
      Role.create(name: 'project_manager')
      user = create(:user)
      User.project_managers.should == [user]
    end
  end

  context 'it will return developer only' do
    it 'should have a user with developer role' do
      Role.create(name: 'developer')
      user = create(:user, roles: [:developer])
      User.developers.should == [user]
    end
  end

  context 'it will return todos of user' do
    it 'should have a todos' do
      Role.create(name: 'developer')
      create(:users_projects, roles: [:developer])
      should have_many(:todos)
    end
  end

  context 'it will return projects of user' do
    it 'should have many projects' do
      Role.create(name: 'developer')
      create(:users_projects, roles: [:developer])
      should have_and_belong_to_many(:projects)
    end
  end
end
