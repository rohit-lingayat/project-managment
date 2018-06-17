FactoryBot.define do
  factory :role do
    [:project_manager, :developer].each do |role|
      name role.to_s
    end
  end
end
