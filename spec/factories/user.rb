FactoryBot.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email { "#{first_name}_#{rand(6)}@example.com" }
    password 'temp1234'
    password_confirmation 'temp1234'
    roles [:project_manager]

    factory :users_projects do
      after(:create) do |user, _evaluator|
        create(:project, :with_todos, users: [user])
      end
    end
  end
end
