# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Article.create([
  { title: 'First Article', content: 'Content of the first article.', author_id: 1 },
  { title: 'Second Article', content: 'Content of the second article.', author_id: 1 }
])