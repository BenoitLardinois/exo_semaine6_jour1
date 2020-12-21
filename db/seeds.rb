# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

#Reset all data into database
User.destroy_all
City.destroy_all
Gossip.destroy_all

#Création de 10 users
10.times do |index|
  user = User.new
  user.id = index + 1
  user.first_name = Faker::Name.first_name 
  user.last_name = Faker::Name.last_name
  user.email = user.first_name.downcase + "." + user.last_name.downcase + "@hotmail.com"
  user.age = rand(14..65)
  user.description = Faker::Hacker.say_something_smart
  user.save
end
puts "10 utilisateurs on été créés!"
tp User.all, :first_name, :last_name, :email, :age

puts "\n"
puts "\n"

#Création de 10 villes
10.times do |index|
  city = City.new
  city.id = index + 1
  city.name = Faker::Address.city
  city.zip_code = Faker::Address.zip
  city.save
end
puts "10 villes on été créés!"
tp City.all, :id, :name, :zip_code

puts "\n"
puts "\n"

#Attribuer alétoirement une ville à un user:
User.all.each do |u|
  u.city = City.all[rand(0..9)]
  u.save
end
puts "Voici les villes des utilisateurs"
User.all.each do |u|
  puts "- #{u.first_name} #{u.last_name.upcase} habite à #{u.city.name}"
end

puts "\n"
puts "\n"


#On change aléatoirement la ville de l'user ayant l'ID n°3 et on l'affiche
puts "#{User.find(3).first_name} vient de déménager!"
puts "Il(elle) n'habite plus à #{User.find(3).city.name}"
User.find(3).update(city_id: rand(1..10))
puts "mais à #{User.find(3).city.name}!"

puts "\n"
puts "\n"

#Création de 20 gossips
20.times do |index|
  Gossip.create(id: index + 1, title: Faker::Game.title, content: Faker::TvShows::RickAndMorty.quote)
end
puts "20 potins on été créés!"
tp Gossip.all, :id, :title

puts "\n"
puts "\n"

#on attribue aléatoirement chaque potin à un user
Gossip.all.each do |g|
  g.user = User.all.find(rand(1..10))
  g.save
end
# On cite tous les potins d'un utilisateur pris aléatoirement (si il en a posté) : 
random_user = User.all.find(rand(1..10))
puts "\n"
puts "#{random_user.first_name} a dit :"
random_user.gossips.each do |g|
  puts "- " + g.content
end

puts "\n"