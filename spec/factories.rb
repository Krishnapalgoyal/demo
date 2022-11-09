require 'faker'
FactoryBot.define do
  factory :department do
    name{Faker::Name.unique.name}
    jobroll{"to manage"}
  end
  factory :employee do
    email {"kp@123.gmail.com"}
    password{"pk@123"}
    department
  end
  factory :update do
    email {"pk@123.gmail.com"} 
  end
end