require 'faker'

FactoryBot.define do
  factory :family_goal do
    name { Faker::Name.name }
    position { Faker::Job.position }
    area { Faker::Job.field }
    world { Faker::Company.name }
  end
end