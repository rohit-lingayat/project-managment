require 'spec_helper'

describe Project do
  context 'it will return users' do
    it 'should have a user for project' do
      Role.create(name: 'developer')
      create(:users_projects, roles: [:developer])
      should have_and_belong_to_many(:users)
    end
  end
end
