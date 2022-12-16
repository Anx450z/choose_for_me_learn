25.times do
  title = Faker::Movie.title
  rating = Faker::Movie.rand_in_range(1, 5)
  type = 'Topic::Movie'
  Topic.create!(title:, rating:, type:)
end

25.times do
  title = Faker::Food.dish
  rating = Faker::Food.rand_in_range(1, 5)
  type = 'Topic::Food'
  Topic.create!(title:, rating:, type:)
end

25.times do
  title = Faker::Book.title
  rating = Faker::Book.rand_in_range(1, 5)
  type = 'Topic::Book'
  Topic.create!(title:, rating:, type:)
end
