FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    author_id { rand(100) }
  end
end
