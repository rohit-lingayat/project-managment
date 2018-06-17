FactoryBot.define do
  factory :todo do
    task Faker::Company.name
    status 'ToDo'
  end
end
