# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
require 'csv'

Pedal.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pedal_list.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Pedal.new
  t.name = row['name']
  t.price = row['price']
  t.brand = row['brand']
  t.description = row['description']
  t.quantity = row['quantity']
  t.featured = row['featured']
  t.image_url = row['image_url']
  t.kind = row['kind']
  t.category = row['category']
  t.country_origin = row['country_origin']
  t.save
  puts "#{t.name}, #{t.brand} saved"
end

puts "There are now #{Pedal.count} rows in the pedals table"