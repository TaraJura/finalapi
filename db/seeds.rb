# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Visitor.create!(name:"John")
Visitor.create!(name:"Phill")
Visitor.create!(name:"Jason")
Card.create!(number:1)
Card.create!(number:2)
Card.create!(number:3)
Card.create!(number:4)
Card.create!(number:5)
Connector.create!(visitor_id:1,card_id:1,issued_at: Time.now,returned_at: Time.now + 5.years)






