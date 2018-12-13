# spec/factories/todos.rb
FactoryBot.define do
  factory :message do
    body { Faker::Lorem.word }
    type { Faker::Lorem.word }
  end
end