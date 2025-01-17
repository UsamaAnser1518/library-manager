require 'faker'

FactoryBot.define do 
  factory :library do 
    name { Faker::Book.unique.title }
  end
end