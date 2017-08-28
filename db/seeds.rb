# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Deck.destroy_all
Round.destroy_all
User.destroy_all

@deck = Deck.create(name: "TESTING THE DECK")
@user = User.create!(username: "USername test", password: "testpassword")
@card = Card.create(question: "What is your name", answer: "JEn hawk", deck_id: @deck.id, user_id: @user.id)
