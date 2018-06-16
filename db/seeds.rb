# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Stock.create(symbol: 't', company_name: 'AT&T Inc.')
Stock.create(symbol: 'd', company_name: 'Dominion Energy Inc.')
Stock.create(symbol: 'e', company_name: 'ENI S.p.A.')