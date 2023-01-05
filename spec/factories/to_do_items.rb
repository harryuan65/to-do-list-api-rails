FactoryBot.define do
  factory :to_do_item do
    title { Faker::ProgrammingLanguage.name }
    status { "active" }
  end
end
