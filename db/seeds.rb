# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Visitor.create(name: Faker::Name.name, email: Faker::Internet.email , phone:Faker::PhoneNumber.cell_phone , identity_card_type: "IDcard", identity_card_number: Faker::IDNumber.valid_south_african_id_number , expires: Time.now + 5.days , created_at: Time.now , updated_at: Time.now)
end
Card.create!(number:1)
Card.create!(number:2)
Card.create!(number:3)
Card.create!(number:4)
Card.create!(number:5)






