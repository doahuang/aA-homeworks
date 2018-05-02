# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

house1 = House.create(address: '123 abc st')
house2 = House.create(address: '456 def ave')
house3 = House.create(address: '789 xyz blvd')

Person.create(name: 'adam', house_id: house1.id)
Person.create(name: 'ben', house_id: house1.id)
Person.create(name: 'charlie', house_id: house2.id)
Person.create(name: 'edison', house_id: house2.id)
Person.create(name: 'fernando', house_id: house3.id)
Person.create(name: 'george', house_id: house3.id)
Person.create(name: 'harry', house_id: house3.id)
