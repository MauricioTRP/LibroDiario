# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Admin User
require 'csv'

puts "====================Creating Addresses===================="
csv_text_regiones = File.read(Rails.root.join("db", "regiones.csv"))

csv_regiones = CSV.parse(csv_text_regiones, :headers => true, :encoding => "UTF-8")
csv_regiones.each do |row|
  print row
  t = Region.new
  t.id = row["id"]
  t.region = row["region"]
  t.ordinal = row["ordinal"]
  
  t.save
end

csv_text_provinces = File.read(Rails.root.join("db", "provincias.csv"))
csv_provinces = CSV.parse(csv_text_provinces, :headers => true, :encoding => "UTF-8")
csv_provinces.each do |row|
  t = Province.new
  t.id = row["id"]
  t.provincia = row["provincia"]
  t.region_id = row["region_id"]

  t.save
end

csv_text_comunes = File.read(Rails.root.join("db", "comunas.csv"))
csv_comunas = CSV.parse(csv_text_comunes, :headers => true, :encoding => "UTF-8")
csv_comunas.each do |row|
  t = Comune.new
  t.id = row["id"]
  t.comuna = row["comuna"]
  t.province_id = row["province_id"]
  t.region_id = row["region_id"]

  t.save
end

puts "====================Creating Admin User===================="

User.create(
  email: 'admin@example.com',
  name: 'admin',
  last_name: 'admin',
  rut: '11111111-1',
  role: 'admin',
  password: '123456',
  password_confirmation: '123456',
  address: {
    "street_address": 'calle 123',
    "city": 'ciudad',
    "state": 'region',
    "zip": '111111'
  },
  contact_info: {
    phone_1: '1234567',
    phone_2: '7654321'
  }
)

puts "====================Creating Normal User===================="

User.create(
  email: 'normal@example.com',
  name: 'normal',
  last_name: 'normal',
  rut: '22222222-2',
  role: 'normal_user',
  password: '123456',
  password_confirmation: '123456',
  address: {
    "street_address": 'calle 123',
    "city": 'ciudad',
    "state": 'region',
    "zip": '111111'
  },
  contact_info: {
    phone_1: '1234567',
    phone_2: '7654321'
  }
)

puts '====================Creating AccountTypes===================='

AccountType.create([
  {code: 1, name: 'Activo'},
  {code: 2, name: 'Pasivo'},
  {code: 3, name: 'Capital'},
  {code: 4, name: 'Resultado'}
])