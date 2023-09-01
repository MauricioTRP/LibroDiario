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

puts '======================Creating Accounts======================'
Account.create([
  { 
    code: '1.10.1',
    name: 'Caja',
    description: 'Fondos en caja tanto en moneda nacional como extranjera de disponibilidad inmediata',
    type: AccountType.find_by(name: 'Activo'),
    subtype: 'Circulante'
  },
  {
    code: '1.20.1',
    name: 'Banco',
    description: 'Representa los valores disponibles en la cuenta corriente que la empresa mantiene en el banco',
    type: AccountType.find_by(name: 'Activo'),
    subtype: 'Circulante'
  },
  {
    code: '1.50.1',
    name: 'Mercaderías',
    description: 'Productos fabricados por la empresa, destinados al consumo final',
    type: AccountType.find_by(name: 'Activo'),
    subtype: 'Circulante'
  },
  {
    code: '2.10.1',
    name: 'Terrenos',
    description: 'Activos fijos inmobiliarios, no depreciables y no reproducibles',
    type: AccountType.find_by(name: 'Activo'),
    subtype: 'Fijo'
  },
  {
    code: '1.10.1',
    name: 'Obligaciones con bancos e instituciones financieras',
    description: 'Prestamos otorgados por bancos e instituciones financieras corto plazo',
    type: AccountType.find_by(name: 'Pasivo'),
    subtype: 'Circulante'
  },
  {
    code: '1.30.1',
    name: 'Cuentas y documentos por pagar',
    description: 'Obligaciones no documentadas y cuentas por pagar documentadas',
    type: AccountType.find_by(name: 'Pasivo'),
    subtype: 'Circulante'
  },
  {
    code: '2.10.1',
    name: 'Obligaciones con bancos e instituciones financieras L/P',
    description: 'Prestamos otorgados por bancos e instituciones financieras largo plazo',
    type: AccountType.find_by(name: 'Pasivo'),
    subtype: 'Largo Plazo'
  },
  {
    code: '2.30.1',
    name: 'Cuentas y documentos por pagar L/P',
    description: 'Obligaciones documentadas y no documentadas largo plazo',
    type: AccountType.find_by(name: 'Pasivo'),
    subtype: 'Largo Plazo'
  },
  {
    code: '1.10.1',
    name: 'Capital pagado',
    description: 'Capital aportado y efectivamente pagado por empresarios o socios',
    type: AccountType.find_by(name: 'Capital')
  },
  {
    code: '2.10.1',
    name: 'Utilidades acumuladas',
    description: 'Utilidades acumuladas que provienen de ejercicios anteriores',
    type: AccountType.find_by(name: 'Capital')
  },
  {
    code: '2.30.1',
    name: 'Utilidad del ejercicio',
    description: 'Utilidad o pérdida del ejercicio',
    type: AccountType.find_by(name: 'Capital')
  },
  {
    code: '2.40.1',
    name: 'Pérdida y ganancia',
    description: 'Cuenta puente para generar asientos de cierre',
    type: AccountType.find_by(name: 'Capital')
  },
  {
    code: '1.10.1',
    name: 'Ingreso por venta de bienes y servicios del giro',
    description: 'Ventas totales efectuadas por la empresa durante periodo cubierto por el estado de resultados',
    type: AccountType.find_by(name: 'Resultado'),
    subtype: 'Ganancia'
  },
  {
    code: '2.10.1',
    name: 'Costo directo por venta de bienes y servicios del giro',
    description: 'Costo de los productos y servicios, determinado de acuerdo con el sistema de costo llevado por la empresa',
    type: AccountType.find_by(name: 'Resultado'),
    subtype: 'Pérdida'
  },
  {
    code: '3.10.1',
    name: 'Gastos Generales',
    description: 'Gastos menores relacionados con la administración de la empresa y no atribuibles a un área específica dentro de ella',
    type: AccountType.find_by(name: 'Resultado'),
    subtype: 'Pérdida'
  }
])