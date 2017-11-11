FactoryBot.define do
  factory :page_element do
    content { Faker::Lorem.sentence}
    element_type { Faker::Number.between(1,3)}
  end
end