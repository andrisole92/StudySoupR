FactoryBot.define do
  factory :session do
    title { Faker::StarWars.character }
    status { Faker::StarWars.character }
    startAt DateTime.now
  end
end