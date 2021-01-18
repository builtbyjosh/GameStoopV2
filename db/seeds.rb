# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.create(name: "mario", description: "Classic Platformer", price: 20, genre: "platformer")
Game.create(name: "mario 2", description: "Horrible Platformer", price: 5, genre: "platformer")
Game.create(name: "mario 3", description: "Great Platformer", price: 35, genre: "platformer")
Game.create(name: "God Of War", description: "Kill Gods", price: 30, genre: "strategy")
Game.create(name: "God Of War 2", description: "Kill Gods", price: 40, genre: "strategy")
Game.create(name: "God Of War 3", description: "Kill Gods", price: 50, genre: "strategy")
Game.create(name: "Farming Simulator 19", description: "Run your own farm", price: 25, genre: "simulation")
Game.create(name: "Hitman", description: "Stealth First Person Shooter", price: 25, genre: "fps")
Game.create(name: "Hitman 2", description: "Stealth First Person Shooter", price: 35, genre: "fps")
Game.create(name: "Hitman 3", description: "Stealth First Person Shooter", price: 45, genre: "fps")
Game.create(name: "Call of Duty", description: "First Person Shooter", price: 15, genre: "fps")AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?