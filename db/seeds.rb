# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Admin User

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