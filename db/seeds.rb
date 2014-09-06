# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


contractor1 = Contractor.create(name: "contractor1", email: "contractor@gmail.com", password: "password", password_confirmation: "password")

employee1 = Employee.create(name: "Employee", email: "employee@gmail.com", password: "password", password_confirmation: "password")

company1 = Company.create(name: "Funny business")

job1 = Job.create(description: "an amazing job")

jobsearch1 = Jobsearch.create()

qualification1 = Qualification.create(name: "iata level 3")

address1 = Address.create(line1: "first random address")
address2 = Address.create(line1: "second random address")


