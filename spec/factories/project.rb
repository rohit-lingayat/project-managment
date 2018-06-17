FactoryBot.define do
  factory :project do
    name Faker::Company.name
    trait :with_todos do
      after(:create) do |project|
        create(:todo, project: project, user: project.users.first)
      end
    end
  end
end
