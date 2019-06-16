# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


clients = Client.create([{email: 'robb@gmail.com'}, {username: 'robb123'}, {password_digest: 'abc123'}])
clients = Client.create([{email: 'katie@gmail.com'}, {username: 'katie456'}, {password_digest: 'abc456'}])
clients = Client.create([{email: 'rosie@gmail.com'}, {username: 'rosie789'}, {password_digest: 'abc789'}])

instructors = Instructor.create([{name: 'sam'}, {gym: 'globo'}, {specialty: 'strength'}])
instructors = Instructor.create([{name: 'amber'}, {gym: 'planet fitness'}, {specialty: 'cardio'}])
instructors = Instructor.create([{name: 'tyler'}, {gym: 'dynamix'}, {specialty: 'crossfit'}])
